//
//  BtnBodyWeightCategorieView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI

struct BodyWeightBtnCategorieView: View {
    @Binding var selectedCategory: BodyWeightCategories? // Permet de passer une catégorie optionnelle
    var category: BodyWeightCategories? // Catégorie optionnelle, `nil` signifie "Toutes"
    
    var colorCategory: Color {
        switch category {
        case .calisthenics: return .teal
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
                Text(category?.localizedName() ?? NSLocalizedString("Tous", comment: ""))
                    .font(.system(size: 10))
                    .bold()
            }
        }
    }
}

#Preview {
    BodyWeightBtnCategorieView(selectedCategory: .constant(.calisthenics), category: .calisthenics)
}
