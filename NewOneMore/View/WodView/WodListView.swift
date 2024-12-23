//
//  WodListView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//

import SwiftUI
import SwiftData

struct WodListView: View {
    @Query var wods: [Wod]
    @State private var showingAddItemView = false
    @State private var showingFilterSheet = false
    @State private var selectedCategory: WodCategories? = nil
    @State private var searchText: String = ""
    @Environment(\.colorScheme) var colorScheme
    @State private var isAnimating = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if !wods.isEmpty {
                    HStack {
                        TextField("Rechercher un wod", text: $searchText)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                        Button(action: {
                            showingFilterSheet = true
                        }) {
                            Image("filter")
                                .resizable()
                                  .scaledToFit()
                                  .foregroundColor(colorScheme == .dark ? .white : .black)
                                  .frame(width: 40, height: 40)

                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                
                if wods.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Ajoute ton premier WOD")
                            .font(Font.custom("edosz", size: 24, relativeTo: .title))
                            .fontWeight(.bold)
                        Text("Pour ajouter un WOD, appuie sur le bouton **+** ci-dessus, tu pourras sélectionner les WODs disponibles.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .padding(.bottom, 140)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredWods, id: \.nom) { wod in
                                NavigationLink(destination: WodDetailView(wod: wod)) {
                                    WodCardView(colorCategory: wod.couleurCategorie, image: wod.image, nom: wod.nom, times: wod.times, dates: wod.dates)
                                }
                            }
                        }
                        .padding(.all, 16)
                    }
                }
            }
            .navigationTitle("WODs")
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    showingAddItemView = true
                    isAnimating = false
                }) {
                    Text("+")
                        .font(Font.custom("edosz", size: 70, relativeTo: .title))
                        .foregroundStyle((colorScheme == .dark) ? .white : .black)
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .animation(isAnimating ? .easeInOut(duration: 0.6).repeatForever(autoreverses: true) : .default, value: isAnimating)
                }
                .onAppear {
                    if wods.isEmpty {
                        isAnimating = true
                    }
                }
                .padding(.top)
                .padding(.trailing, 5)
            })
            .sheet(isPresented: $showingAddItemView) {
                WodAddView(selectedWODs: wods.map { $0.nom })
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(
                    title: Text("Filtrer par catégorie"),
                    buttons: categoryFilterButtons()
                )
            }
        }
    }
    
    var filteredWods: [Wod] {
        let filteredByCategory: [Wod]
        
        if let category = selectedCategory {
            filteredByCategory = wods.filter { wod in
                return wod.getCategories().contains(category)
            }
        } else {
            filteredByCategory = wods
        }
        
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return filteredByCategory.filter { wod in
                wod.nom.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private func categoryFilterButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = WodCategories.allCases.map { category in
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
    WodListView()
        .modelContainer(for: Wod.self)
}
