//
//  GymCardMoveView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//

import SwiftUI

struct GymCardMoveView: View {
    let item: GymMove
    let isSelected: Bool
    let onSelect: () -> Void
    
    // Fonction pour déterminer la couleur en fonction de la catégorie
    var categoryColor: Color {
        switch item.category {
        case .calisthenics:
            return .mint
        case .gymnastique:
            return .indigo
        }
    }
    
    var iconCategory: String {
        switch item.category {
        case .calisthenics: return  "figure.play"
        case .gymnastique: return  "figure.gymnastics"
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
                        Text(item.category.rawValue) // Utilisation du nom de la catégorie
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
    GymCardMoveView(
        item: GymMove(nom: "Pull-Up-Strict", subtitle: "...", imageName: "Pull-Up-Strict", category: .calisthenics),
        isSelected: false,
        onSelect: {
            print("Pull-Up-Strict selected")
        }
    )
}

