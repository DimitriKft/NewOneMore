//
//  CardMoveBodyWeightView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI

struct BodyWeightCardMoveView: View {
    let item: BodyWeightMove
    let isSelected: Bool
    let onSelect: () -> Void
    
    // Fonction pour déterminer la couleur en fonction de la catégorie
    var categoryColor: Color {
        switch item.category {
        case .streetWorkout:
            return .teal
        case .gymnastique:
            return .purple
        }
    }

    var iconCategory: String {
        switch item.category {
        case .streetWorkout: return "figure.pullups"
        case .gymnastique: return "figure.gymnastics"
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
    BodyWeightCardMoveView(
        item: BodyWeightMove(nom: "Pull-Up", subtitle: "Les tractions sont un exercice fondamental du street workout.", imageName: "Pull-Up", category: .streetWorkout),
        isSelected: false,
        onSelect: {
            print("Pull-Up selected")
        }
    )
}

