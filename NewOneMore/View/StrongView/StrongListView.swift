//
//  ContentView.swift
//  NewOneMore
//
//  Created by dimitri on 17/09/2024.
//
import SwiftUI
import SwiftData

struct StrongListView: View {
    @Query var strongs: [Strong]
    @State private var showingAddItemView = false
    @State private var showingFilterSheet = false
    @State private var selectedCategory: Categories? = nil
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
                if !strongs.isEmpty {
                    HStack {
                        TextField("Rechercher un mouvement", text: $searchText)
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
                
                if strongs.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Ajoute ton premier PR")
                            .font(Font.custom("edosz", size: 24, relativeTo: .title))
                            .fontWeight(.bold)
                        Text("Pour sélectionner ton premier mouvement de force, appuie sur le bouton + ci-dessus. Tu pourras consulter les mouvements disponibles pour tes PR et les ajouter ici.")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .padding(.bottom, 140)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredStrongs, id: \.nom) { strong in
                                NavigationLink(destination: StrongDetailView(strong: strong)) {
                                    StrongCardView(colorCategory: strong.couleurCategorie, image: strong.image, nom: strong.nom, scores: strong.scores, dates: strong.dates)
                                }
                            }
                        }
                        .padding(.all, 16)
                    }
                }
            }
            .navigationTitle("Force ")
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
                    if strongs.isEmpty {
                        isAnimating = true
                    }
                }
                .padding(.top)
                .padding(.trailing, 5)
            })
            .sheet(isPresented: $showingAddItemView) {
                StrongAddView(selectedStrongs: strongs.map { $0.nom })
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(
                    title: Text("Filtrer par catégorie"),
                    buttons: categoryFilterButtons()
                )
            }
        }   .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.largeTitleTextAttributes = [
                .font: UIFont(name: "edosz", size: 34)!,
            ]
            appearance.titleTextAttributes = [
                .font: UIFont(name: "edosz", size: 20)!,
            ]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var filteredStrongs: [Strong] {
        let filteredByCategory: [Strong]
        if let category = selectedCategory {
            filteredByCategory = strongs.filter { strong in
                return matchesSelectedCategory(strong: strong, selectedCategory: category)
            }
        } else {
            filteredByCategory = strongs
        }
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return filteredByCategory.filter { strong in
                strong.nom.lowercased().contains(searchText.lowercased())
            }
        }
    }

    func matchesSelectedCategory(strong: Strong, selectedCategory: Categories) -> Bool {
        return strong.categories.contains(selectedCategory.rawValue)
    }

    private func categoryFilterButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = Categories.allCases.map { category in
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
    StrongListView()
        .modelContainer(for: Strong.self)
}
