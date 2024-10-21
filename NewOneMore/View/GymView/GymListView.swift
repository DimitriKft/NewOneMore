//
//  GymListView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//

import SwiftUI
import SwiftData

struct GymListView: View {
    @Query var gyms: [Gym]
    @State private var showingAddItemView = false
    @State private var showingFilterSheet = false
    @State private var selectedCategory: GymCategories? = nil
    @State private var searchText: String = ""
    @Environment(\.colorScheme) var colorScheme
    @State private var isAnimating = false // Variable pour gérer l'animation
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if !gyms.isEmpty {
                    HStack {
                        TextField("Rechercher un mouvement", text: $searchText)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)

                        // Bouton des filtres dans la searchbar
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
                
                if gyms.isEmpty {
                    
                    VStack(alignment: .leading) {
                        Text("Ajoute ton premier PR")
                            .font(Font.custom("edosz", size: 24, relativeTo: .title))
                            .fontWeight(.bold)
                        Text("Pour sélectionner ton premier mouvement de gymnastique ou calisthénie, appuie sur le bouton + ci-dessus. Tu pourras consulter les mouvements disponibles pour tes PR et les ajouter ici.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .padding(.bottom, 140)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredGyms, id: \.nom) { gym in
                                NavigationLink(destination: GymDetailView(gym: gym)) {
                                    GymCardView(colorCategory: gym.couleurCategorie, image: gym.image, nom: gym.nom, scores: gym.scores, dates: gym.dates)
                                }
                            }
                        }
                        .padding(.all, 16)
                    }
                }
            }
            .navigationTitle("Gym")
            .navigationBarItems(trailing: HStack {
             
                // Animation si la liste est vide
                Button(action: {
                    showingAddItemView = true
                    isAnimating = false // Désactiver l'animation après utilisation
                }) {
                    Text("+")
                        .font(Font.custom("edosz", size: 70, relativeTo: .title))
                        .foregroundStyle((colorScheme == .dark) ? .white : .black)
                        .scaleEffect(isAnimating ? 1.2 : 1.0) // Augmente légèrement la taille pendant l'animation
                        .animation(isAnimating ? .easeInOut(duration: 0.6).repeatForever(autoreverses: true) : .default, value: isAnimating) // Animation de rebond si `isAnimating` est activé
                }
                .onAppear {
                    // Activer l'animation lorsque la liste est vide
                    if gyms.isEmpty {
                        isAnimating = true
                    }
                }
                .padding(.top)
                .padding(.trailing, 5)
            })
            .sheet(isPresented: $showingAddItemView) {
                GymAddView(selectedGyms: gyms.map { $0.nom })
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(
                    title: Text("Filtrer par catégorie"),
                    buttons: categoryFilterButtons()
                )
            }
        }
    }
    
    var filteredGyms: [Gym] {
        let filteredByCategory: [Gym]
        if let category = selectedCategory {
            filteredByCategory = gyms.filter { gym in
                return matchesSelectedCategory(gym: gym, selectedCategory: category)
            }
        } else {
            filteredByCategory = gyms
        }
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return filteredByCategory.filter { gym in
                gym.nom.lowercased().contains(searchText.lowercased())
            }
        }
    }


    func matchesSelectedCategory(gym: Gym, selectedCategory: GymCategories) -> Bool {
        return gym.categories.contains(selectedCategory.rawValue)
    }

    
    private func categoryFilterButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = GymCategories.allCases.map { category in
            .default(Text(category.localizedName())) {
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
    GymListView()
        .modelContainer(for: Gym.self)
}
