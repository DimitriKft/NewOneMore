//
//  BtnAddMoveView.swift
//  NewOneMore
//
//  Created by dimitri on 04/10/2024.
//

import SwiftUI

struct BtnAddMoveView: View {
    var label: String
    var action: () -> Void
    var color: Color
    var colorSecondary: Color
    var imageName: String
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 50)
                    .cornerRadius(12)
                    .foregroundColor(color)
                HStack(alignment: .firstTextBaseline, spacing: 20) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(colorSecondary)
                    Text("\(label)")
                        .font(.headline)
                        .foregroundColor(colorSecondary)
                }
            }
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

#Preview {
    BtnAddMoveView(
        label: "Ajouter un mouvement",
        action: {
            print("Test BtnAddMoveView")
        },
        color: .yellow,
        colorSecondary: .black,
        imageName: "yourImageName" 
    )
}
