//
//  BodyWeightListView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI
import SwiftData

struct BodyWeightListView: View {
    @Query var bodyWeights: [BodyWeight]
    @State private var showingAddItemView = false
    @State private var showingFilterSheet = false
    @State private var selectedCategory: BodyWeightCategories? = nil
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if !bodyWeights.isEmpty {
                    HStack {
                        TextField("Rechercher un mouvement", text: $searchText)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
                
                if bodyWeights.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Ajoute ton premier PR")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Pour sélectionner ton premier mouvement, appuie sur le bouton **+** ci-dessus, tu pourras consulter les mouvements disponibles pour tes **PR** et les ajouter ici.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .padding(.bottom, 140)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredBodyWeights, id: \.nom) { bodyWeight in
                                NavigationLink(destination: BodyWeightDetailView(bodyWeight: bodyWeight)) {
                                    BodyWeightCardView(colorCategory: bodyWeight.couleurCategorie, image: bodyWeight.image, nom: bodyWeight.nom, scores: bodyWeight.scores, dates: bodyWeight.dates)
                                }
                            }
                        }
                        .padding(.all, 16)
                    }
                }
            }
            .navigationTitle("Poids du Corps")
            .navigationBarItems(trailing: HStack {
                if !bodyWeights.isEmpty {
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
                BodyWeightAddView(selectedBodyWeights: bodyWeights.map { $0.nom })
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(
                    title: Text("Filtrer par catégorie"),
                    buttons: categoryFilterButtons()
                )
            }
        }
    }
    
    var filteredBodyWeights: [BodyWeight] {
        let filteredByCategory: [BodyWeight]
        
        if let category = selectedCategory {
            filteredByCategory = bodyWeights.filter { bodyWeight in
                return bodyWeight.getCategories().contains(category)
            }
        } else {
            filteredByCategory = bodyWeights
        }
        
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return filteredByCategory.filter { bodyWeight in
                bodyWeight.nom.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private func categoryFilterButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = BodyWeightCategories.allCases.map { category in
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
    BodyWeightListView()
        .modelContainer(for: BodyWeight.self)
}
