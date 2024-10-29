//
//  GymAddView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//
import SwiftUI
import SwiftData

struct GymAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var selectedGyms: [String]
    
    @State private var selectedItem: GymMove? = nil
    @State private var availableItems = gymMoves
    @State private var selectedCategory: GymCategories? = nil
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    ActionBtnView(icon: "chevron.down.circle.fill", color: .white, colorPrimary: .black) {
                        dismiss()
                    }
                    .padding(.top, 25)
                    .padding(.leading, 30)
                    Spacer()
                }
                HStack(alignment: .top, spacing: 65) {
                    GymBtnCategorieView(selectedCategory: $selectedCategory, category: nil)
                    GymBtnCategorieView(selectedCategory: $selectedCategory, category: .calisthenics)
                    GymBtnCategorieView(selectedCategory: $selectedCategory, category: .gymnastique)
                }
                .padding(.horizontal)
                
                TextField("Rechercher un mouvement", text: $searchText)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                ScrollView {
                    if filteredItems().isEmpty {
                        Spacer()
                        VStack {
                            Text("Tu as ajouté tous les mouvements !")
                                .font(Font.custom("edosz", size: 16 , relativeTo: .title))

                            Text("Reviens dans quelque temps, nous mettons à jour nos mouvements régulièrement. Et n'hésite pas à nous contacter si tu as des mouvements manquants.")
                                .font(.system(size: 15))

                            Text("www.one-more.com")
                                .font(.system(size: 11))
                                .padding(.top, 16)
                        }
                        .padding()
                    }
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredItems(), id: \.self) { item in
                            GymCardMoveView(
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
                        label: String(format: NSLocalizedString("Ajouter %@", comment: "Bouton pour ajouter une activité sélectionnée"), selectedItem.nom),
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
    
    func colorForCategory(_ category: GymCategories) -> Color {
        switch category {
        case .calisthenics:
            return Color.mint
        case .gymnastique:
            return Color.indigo
        }
    }
    
    func filteredItems() -> [GymMove] {
        return availableItems.filter { item in
            (selectedCategory == nil || item.category == selectedCategory) &&
            !selectedGyms.contains(item.nom) &&
            (searchText.isEmpty || item.nom.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    func ajouterItem() {
        guard let selectedItem = selectedItem else { return }
        
        let nouvelItem = Gym(
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
    GymAddView(selectedGyms: ["empty!"])
        .modelContainer(for: Gym.self)
}
