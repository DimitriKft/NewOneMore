//
//  EnduranceDescriptionView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI

struct EnduranceDescriptionView: View {
    var name: String
    var subtitle: String
    var couleurCategorie: Color
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                ActionBtnView(icon: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
            Text(name)
                .font(Font.custom("edosz", size: 38 , relativeTo: .title))
                .fontWeight(.bold)
                .foregroundColor(couleurCategorie)

            ScrollView {
                Text(subtitle)
                    .font(.body)
                    .padding()
            }
            Spacer()
//            PrimaryBtnView(
//                label: "Retour",
//                action: { dismiss() },
//                color: .secondary,
//                colorSecondary: .white,
//                icon: "arrow.uturn.left"
//            )
        }
        .padding()
    }
}

#Preview {
    EnduranceDescriptionView(name: "10K Run", subtitle: "Course de 10 kilomètres", couleurCategorie: .blue)
}
