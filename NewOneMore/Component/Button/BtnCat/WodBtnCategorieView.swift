//
//  WodBtnCategorieView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//



import SwiftUI

struct WodBtnCategorieView: View {
    @Binding var selectedCategory: WodCategories?
    var category: WodCategories?

    var colorCategory: Color {
        switch category {
        case .girl: return .purple
        case .hero: return .green
        case .open: return .brown
        default: return .black
        }
    }

    var iconCategory: String {
        switch category {
        case .girl: return "figure.cross.training"
        case .hero: return "medal.fill"
        case .open: return "trophy.fill"
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
                    .bold()
            }
        }
    }
}

#Preview {
    WodBtnCategorieView(selectedCategory: .constant(.girl), category: .girl)
}

