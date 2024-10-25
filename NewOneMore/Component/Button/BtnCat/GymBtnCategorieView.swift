//
//  GymBtnCategorieView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//

import SwiftUI

struct GymBtnCategorieView: View {
    @Binding var selectedCategory: GymCategories?
    var category: GymCategories?
    
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
                Text(category?.localizedName() ?? NSLocalizedString("Tous", comment: "")) 
                    .font(.system(size: 10))
                    .bold()
            }
        }
    }
}

#Preview {
    GymBtnCategorieView(selectedCategory: .constant(.calisthenics), category: .calisthenics)
}
