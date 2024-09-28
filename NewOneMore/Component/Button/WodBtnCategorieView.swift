//
//  WodBtnCategorieView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//



import SwiftUI

struct WodBtnCategorieView: View {
    @Binding var selectedCategory: WodCategories? // Permet de passer une catégorie optionnelle
    var category: WodCategories? // Catégorie optionnelle, `nil` signifie "Toutes"

    var colorCategory: Color {
        switch category {
        case .girl: return .purple
        case .hero: return .green
        default: return .black
        }
    }

    var iconCategory: String {
        switch category {
        case .girl: return "figure.run.circle.fill"
        case .hero: return "shield.fill"
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
    WodBtnCategorieView(selectedCategory: .constant(.girl), category: .girl)
}

