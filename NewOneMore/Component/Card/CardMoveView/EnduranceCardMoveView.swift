//
//  EnduranceCardMoveView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//



import SwiftUI

struct EnduranceCardMoveView: View {
    let item: EnduranceMove
    let isSelected: Bool
    let onSelect: () -> Void
    
    // Fonction pour déterminer la couleur en fonction de la catégorie WOD
    var categoryColor: Color {
        switch item.category {
        case .outdoor:
            return .orange
        case .indoor:
            return .blue
        }
    }

    var iconCategory: String {
        switch item.category {
        case .outdoor: return "figure.run"
        case .indoor: return "figure.indoor.cycle"
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
    EnduranceCardMoveView(
        item: EnduranceMove(nom: "Fran", subtitle: "21-15-9 Thrusters & Pull-Ups", imageName: "Fran", category: .outdoor),
        isSelected: false,
        onSelect: {
            print("Fran selected")
        }
    )
}
