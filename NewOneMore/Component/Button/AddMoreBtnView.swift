//
//  AddMoreBtnView.swift
//  NewOneMore
//
//  Created by dimitri on 15/10/2024.
//

import SwiftUI


struct AddMoreBtnView: View {
    var image: String
    var color: Color
    var colorPrimary: Color
    var action: () -> Void 

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {

                Image(image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .font(.title2)
                    .foregroundColor(color)
            }
        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//                .stroke(color, lineWidth: 1)
//        )
    }
}

#Preview {
    AddMoreBtnView(image: "addMore", color: .pink, colorPrimary: .black) {
        print("Trash button tapped")
    }
}
