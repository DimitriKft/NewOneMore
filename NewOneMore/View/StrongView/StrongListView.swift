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
                            .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
                
                if strongs.isEmpty {
                    
                    VStack(alignment: .leading) {
                        Text("Ajoute ton premier PR")
                            .font(.title)
                            .fontWeight(.bold)
                       Text("Pour selectionier ton premier mouvement, appuis sur le bouton **+** ci-dessus, tu pourra consulter les mouvements disponible pour tes **PR** et les ajouter ici. ")
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
            .navigationTitle("Force")
            .navigationBarItems(trailing: HStack {
                if !strongs.isEmpty {
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
                StrongAddView(selectedStrongs: strongs.map { $0.nom })
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(
                    title: Text("Filtrer par catégorie"),
                    buttons: categoryFilterButtons()
                )
            }
        }
    }
    
    var filteredStrongs: [Strong] {
        let filteredByCategory: [Strong]
        
        if let category = selectedCategory {
            filteredByCategory = strongs.filter { strong in
                return strong.getCategories().contains(category)
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
    
    private func categoryFilterButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = Categories.allCases.map { category in
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
    StrongListView()
        .modelContainer(for: Strong.self)
}
