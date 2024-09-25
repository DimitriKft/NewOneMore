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
        case .streetWorkout: return .teal
        case .gymnastique: return .purple
        default: return .black
        }
    }
    
    var iconCategory: String {
        switch category {
        case .streetWorkout: return "figure.play"
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
                Text(category?.rawValue ?? "Tous")
                    .font(.system(size: 10))
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    BodyWeightBtnCategorieView(selectedCategory: .constant(.streetWorkout), category: .streetWorkout)
}
