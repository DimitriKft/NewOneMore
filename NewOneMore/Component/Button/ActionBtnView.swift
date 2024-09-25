//
//  BtnActionView.swift
//  NewOneMore
//
//  Created by dimitri on 21/09/2024.
//

import SwiftUI

struct ActionBtnView: View {
    var iconSF: String
    var color: Color
    var colorPrimary: Color
    var action: () -> Void // Closure pour l'action du bouton

    var body: some View {
        Button(action: {
            action() // Exécute l'action fournie
        }) {
            ZStack {
                Rectangle()
                    .fill(colorPrimary)
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
    ActionBtnView(iconSF: "trash", color: .pink, colorPrimary: .white) {
        print("Trash button tapped")
    }
}

