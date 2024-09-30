//
//  WodCardMoveView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//



import SwiftUI

struct WodCardMoveView: View {
    let item: WodMove
    let isSelected: Bool
    let onSelect: () -> Void
    
    // Fonction pour déterminer la couleur en fonction de la catégorie WOD
    var categoryColor: Color {
        switch item.category {
        case .girl:
            return .purple
        case .hero:
            return .green
        }
    }

    var iconCategory: String {
        switch item.category {
        case .girl: return "figure.cross.training"
        case .hero: return "medal.fill"
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(12)
                    .grayscale(1.0)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear.opacity(0.5), Color.black.opacity(0.8)]),
                            startPoint: .top,
                            endPoint: .center
                        )
                        .cornerRadius(12)
                    )
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.nom)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 2)

                    HStack(spacing: 4) {
                        Image(systemName: iconCategory)
                            .foregroundStyle(categoryColor)
                            .font(.system(size: 14))
                        Text(item.category.rawValue)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(8)
                .padding([.leading, .bottom], 8)
            }
            .frame(width: 150, height: 150)
            .shadow(radius: 4)
        }
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    WodCardMoveView(
        item: WodMove(nom: "Fran", subtitle: "21-15-9 Thrusters & Pull-Ups", imageName: "Fran", category: .girl),
        isSelected: false,
        onSelect: {
            print("Fran selected")
        }
    )
}
