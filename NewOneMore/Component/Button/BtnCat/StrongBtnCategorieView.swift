//
//  ButtonCategorie.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import SwiftUI


struct StrongBtnCategorieView: View {
    @Binding var selectedCategory: Categories? // Permet de passer une catégorie optionnelle
    var category: Categories? // Catégorie optionnelle, `nil` signifie "Toutes"
    
    var colorCategory: Color {
        switch category {
        case .halterophilie: return .yellow
        case .musculation: return .red
        default: return .black
        }
    }
    
    var iconCategory: String {
        switch category {
        case .halterophilie: return "figure.strengthtraining.traditional"
        case .musculation: return "figure.strengthtraining.functional"
        default: return "square.grid.2x2"
        }
    }
    
  


    var body: some View {
        Button(action: { selectedCategory = category }) {
            VStack {
                ZStack{
                    Rectangle()
                        .fill(colorCategory)
                        .frame(width: 70,height: 70)
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
    StrongBtnCategorieView(selectedCategory: .constant(.halterophilie), category: .halterophilie)
}
