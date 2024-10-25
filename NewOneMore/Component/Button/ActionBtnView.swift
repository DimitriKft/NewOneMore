//
//  BtnActionView.swift
//  NewOneMore
//
//  Created by dimitri on 21/09/2024.
//

import SwiftUI

struct ActionBtnView: View {
    var icon: String
    var color: Color
    var colorPrimary: Color
    var action: () -> Void 

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Rectangle()
                    .fill(colorPrimary)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                Image(icon)
                    .resizable()
                      .scaledToFit()
                      .foregroundColor(color)
                      .frame(width: 30, height: 30)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: 1)
        )
    }
}

#Preview {
    ActionBtnView(icon: "trash", color: .pink, colorPrimary: .white) {
        print("Trash button tapped")
    }
}

