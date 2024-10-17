//
//  BodyWeightAddView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//


import SwiftUI
import SwiftData

struct BodyWeightAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var selectedBodyWeights: [String]
    
    @State private var selectedItem: BodyWeightMove? = nil
    @State private var availableItems = bodyWeightMoves
    @State private var selectedCategory: BodyWeightCategories? = nil
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack{
                    ActionBtnView(icon: "chevron.down.circle.fill", color: .white, colorPrimary: .black) {
                        dismiss()
                    }
                    .padding(.top, 25)
                    .padding(.leading, 30)
                    Spacer()
                }
                HStack(alignment: .top, spacing: 65) {
                    BodyWeightBtnCategorieView(selectedCategory: $selectedCategory, category: nil)
                    BodyWeightBtnCategorieView(selectedCategory: $selectedCategory, category: .calisthenics)
                    BodyWeightBtnCategorieView(selectedCategory: $selectedCategory, category: .gymnastique)
                }
                .padding(.horizontal)
                
                TextField("Rechercher un mouvement", text: $searchText)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredItems(), id: \.self) { item in
                            BodyWeightCardMoveView(
                                item: item,
                                isSelected: selectedItem == item,
                                onSelect: { selectedItem = item }
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(selectedItem == item ? colorForCategory(item.category) : Color.clear, lineWidth: 2)
                            )
                            .shadow(color: selectedItem == item ? colorForCategory(item.category).opacity(0.2) : Color.clear, radius: 2, x: 0, y: 0)
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            if let selectedItem = selectedItem {
                VStack {
                    Spacer()
                    PrimaryBtnView(
                              label: " Ajouter \(selectedItem.nom)",
                              action: ajouterItem,
                              color: colorScheme == .dark ? .white : .gray,
                              colorSecondary: colorScheme == .dark ? .black : .white,
                              icon: "plus.circle.fill"
                          )
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarItems(leading: Button("Annuler") {
            dismiss()
        })
    }

    func colorForCategory(_ category: BodyWeightCategories) -> Color {
        switch category {
        case .calisthenics:
            return Color.teal
        case .gymnastique:
            return Color.purple
        }
    }

    func filteredItems() -> [BodyWeightMove] {
        return availableItems.filter { item in
            // Filtrer par catégorie
            (selectedCategory == nil || item.category == selectedCategory) &&
            // Vérifier que l'élément n'est pas déjà sélectionné
            !selectedBodyWeights.contains(item.nom) &&
            // Filtrer par texte de recherche
            (searchText.isEmpty || item.nom.localizedCaseInsensitiveContains(searchText))
        }
    }

    func ajouterItem() {
        guard let selectedItem = selectedItem else { return }
        
        let nouvelItem = BodyWeight(
            nom: selectedItem.nom,
            subtitle: selectedItem.subtitle,
            image: selectedItem.imageName,
            descriptionName: "",
            scores: [],
            dates: [Date()],
            categories: [selectedItem.category]
        )
        
        modelContext.insert(nouvelItem)
        dismiss()
    }
}

#Preview {
    BodyWeightAddView(selectedBodyWeights: ["empty!"])
        .modelContainer(for: BodyWeight.self)
}


