//
//  EnduranceBtnCategorieView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//


import SwiftUI

struct EnduranceBtnCategorieView: View {
    @Binding var selectedCategory: EnduranceCategories?
    var category: EnduranceCategories?

    var colorCategory: Color {
        switch category {
        case .outdoor: return .orange
        case .indoor: return .blue
        default: return .black
        }
    }

    var iconCategory: String {
        switch category {
        case .outdoor: return "figure.run"
        case .indoor: return "figure.indoor.cycle"
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
    EnduranceBtnCategorieView(selectedCategory: .constant(.outdoor), category: .outdoor)
}

