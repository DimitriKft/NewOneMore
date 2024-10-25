//
//  WodAddView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//




import SwiftUI
import SwiftData

struct WodAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var selectedWODs: [String]
    
    @State private var selectedItem: WodMove? = nil
    @State private var availableItems = wodMoves
    @State private var selectedCategory: WodCategories? = nil
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
                    
                    WodBtnCategorieView(selectedCategory: $selectedCategory, category: .girl)
                    WodBtnCategorieView(selectedCategory: $selectedCategory, category: .hero)
                    WodBtnCategorieView(selectedCategory: $selectedCategory, category: .open)
                    
                }
                .padding(.horizontal)
                
                TextField("Rechercher un WOD", text: $searchText)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                ScrollView {
                    if filteredItems().isEmpty {
                        Spacer()
                        VStack {
                            Text("Tu as ajouté tous les wods !")
                                .font(Font.custom("edosz", size: 16 , relativeTo: .title))

                            Text("Reviens dans quelque temps, nous mettons à jour nos wods régulièrement. Et n'hésite pas à nous contacter si tu as des wods manquants.")
                                .font(.system(size: 15))

                            Link("www.one-more.com", destination: URL(string: "https://studio-clic.fr")!)
                                .font(.system(size: 11))
                                .padding(.top, 16)
                        }
                        .padding()
                    }
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredItems(), id: \.self) { item in
                            WodCardMoveView(
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
    
    func colorForCategory(_ category: WodCategories) -> Color {
        switch category {
        case .girl:
            return Color.purple
        case .hero:
            return Color.green
        case .open:
            return Color.brown
        }
    }

    func filteredItems() -> [WodMove] {
        return availableItems.filter { item in
            (selectedCategory == nil || item.category == selectedCategory) &&
            !selectedWODs.contains(item.nom) &&
            (searchText.isEmpty || item.nom.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    func ajouterItem() {
        guard let selectedItem = selectedItem else { return }
        
        let nouvelItem = Wod(
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
    WodAddView(selectedWODs: ["Lili", "Momo"])
        .modelContainer(for: Wod.self)
}
