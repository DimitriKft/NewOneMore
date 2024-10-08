//
//  GymBtnCategorieView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//

import SwiftUI

struct GymBtnCategorieView: View {
    @Binding var selectedCategory: GymCategories? // Permet de passer une catégorie optionnelle
    var category: GymCategories? // Catégorie optionnelle, `nil` signifie "Toutes"
    
    var colorCategory: Color {
        switch category {
        case .calisthenics: return .mint
        case .gymnastique: return .indigo
        default: return .black
        }
    }
    
    var iconCategory: String {
        switch category {
        case .calisthenics: return "figure.play"
        case .gymnastique: return "figure.gymnastics"
        default: return "square.grid.2x2"
        }
    }
    
    var body: some View {
        Button(action: { selectedCategory = category }) {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(colorCategory)
                        .frame(width: 70, height: 70)
                        .cornerRadius(12)
                    Image(systemName: iconCategory)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                Text(category?.localizedName() ?? NSLocalizedString("Tous", comment: "")) // Si `category` est `nil`, affiche "Tous"
                    .font(.system(size: 10))
                    .bold()
            }
        }
    }
}

#Preview {
    GymBtnCategorieView(selectedCategory: .constant(.calisthenics), category: .calisthenics)
}
