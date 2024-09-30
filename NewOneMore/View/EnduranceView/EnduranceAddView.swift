//
//  EnduranceAddView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI
import SwiftData

struct EnduranceAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var selectedEndurances: [String]
    
    @State private var selectedItem: EnduranceMove? = nil
    @State private var availableItems = enduranceMoves
    @State private var selectedCategory: EnduranceCategories? = nil
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    ActionBtnView(iconSF: "arrow.backward", color: .white, colorPrimary: .black) {
                        dismiss()
                    }
                    .padding(.top, 25)
                    .padding(.leading, 30)
                    Spacer()
                }
                HStack(alignment: .top, spacing: 65) {
                    EnduranceBtnCategorieView(selectedCategory: $selectedCategory, category: nil)
                    EnduranceBtnCategorieView(selectedCategory: $selectedCategory, category: .run)
                    EnduranceBtnCategorieView(selectedCategory: $selectedCategory, category: .swim)
                }
                .padding(.horizontal)
                
                TextField("Rechercher un exercice", text: $searchText)
                    .padding(10)
                    .frame(width: 340)
                    .background(Color(.black))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredItems(), id: \.self) { item in
                            EnduranceCardMoveView(
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
                    PrimaryBtnView(label: " Ajouter \(selectedItem.nom)", action: ajouterItem, color: .white, colorSecondary: .black, icon: "plus.circle.fill")
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarItems(leading: Button("Annuler") {
            dismiss()
        })
    }
    
    func colorForCategory(_ category: EnduranceCategories) -> Color {
        switch category {
        case .run:
            return Color.orange
        case .swim:
            return Color.blue
        }
    }

    func filteredItems() -> [EnduranceMove] {
        return availableItems.filter { item in
            // Vérification de la catégorie
            (selectedCategory == nil || item.category == selectedCategory) &&
            // Vérification que l'élément n'est pas déjà sélectionné
            !selectedEndurances.contains(item.nom) &&
            // Vérification du texte de recherche
            (searchText.isEmpty || item.nom.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    func ajouterItem() {
        guard let selectedItem = selectedItem else { return }
        
        let nouvelItem = Endurance(
            nom: selectedItem.nom,
            subtitle: selectedItem.subtitle,
            image: selectedItem.imageName,
            descriptionName: "",
            times: [],
            dates: [Date()],
            categories: [selectedItem.category]
        )
        
        modelContext.insert(nouvelItem)
        dismiss()
    }
}

#Preview {
    EnduranceAddView(selectedEndurances: ["Run 5K", "Swim 100m"])
        .modelContainer(for: Endurance.self)
}
