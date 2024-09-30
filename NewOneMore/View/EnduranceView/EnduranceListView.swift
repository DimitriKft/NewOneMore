//
//  EnduranceListView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI
import SwiftData

struct EnduranceListView: View {
    @Query var endurances: [Endurance]
    @State private var showingAddItemView = false
    @State private var showingFilterSheet = false
    @State private var selectedCategory: EnduranceCategories? = nil
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if !endurances.isEmpty {
                    HStack {
                        TextField("Rechercher une activité", text: $searchText)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
                
                if endurances.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Ajoute ta première activité d'endurance")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Pour ajouter une activité d'endurance, appuie sur le bouton **+** ci-dessus, tu pourras sélectionner les activités disponibles.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .padding(.bottom, 140)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredEndurances, id: \.nom) { endurance in
                                NavigationLink(destination: EnduranceDetailView(endurance: endurance)) {
                                    EnduranceCardView(colorCategory: endurance.couleurCategorie, image: endurance.image, nom: endurance.nom, times: endurance.times, dates: endurance.dates)
                                }
                            }
                        }
                        .padding(.all, 16)
                    }
                }
            }
            .navigationTitle("Endurance")
            .navigationBarItems(trailing: HStack {
                if !endurances.isEmpty {
                    Button(action: {
                        showingFilterSheet = true
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 38, height: 38)
                                .cornerRadius(8)
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 0.6)
                                .opacity(0.8)
                        )
                    }
                }
                
                Button(action: {
                    showingAddItemView = true
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 38, height: 38)
                            .cornerRadius(8)
                        Image(systemName: "plus")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 0.6)
                            .opacity(0.8)
                    )
                }
            })
            .sheet(isPresented: $showingAddItemView) {
                EnduranceAddView(selectedEndurances: endurances.map { $0.nom })
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(
                    title: Text("Filtrer par catégorie"),
                    buttons: categoryFilterButtons()
                )
            }
        }
    }
    
    var filteredEndurances: [Endurance] {
        let filteredByCategory: [Endurance]
        
        if let category = selectedCategory {
            filteredByCategory = endurances.filter { endurance in
                return endurance.getCategories().contains(category)
            }
        } else {
            filteredByCategory = endurances
        }
        
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return filteredByCategory.filter { endurance in
                endurance.nom.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private func categoryFilterButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = EnduranceCategories.allCases.map { category in
                .default(Text(category.rawValue)) {
                    selectedCategory = category
                }
        }
        buttons.append(.cancel(Text("Annuler")))
        buttons.append(.default(Text("Toutes les catégories")) {
            selectedCategory = nil
        })
        return buttons
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

#Preview {
    EnduranceListView()
        .modelContainer(for: Endurance.self)
}