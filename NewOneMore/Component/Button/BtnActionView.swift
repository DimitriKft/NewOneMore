//
//  BtnActionView.swift
//  NewOneMore
//
//  Created by dimitri on 21/09/2024.
//

import SwiftUI

struct BtnActionView: View {
    var iconSF: String
    var color: Color
    var action: () -> Void // Closure pour l'action du bouton

    var body: some View {
        Button(action: {
            action() // Exécute l'action fournie
        }) {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                Image(systemName: iconSF)
                    .font(.title2)
                    .foregroundColor(color)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(color, lineWidth: 1)
        )
    }
}

#Preview {
    BtnActionView(iconSF: "trash", color: .pink) {
        print("Trash button tapped")
    }
}

