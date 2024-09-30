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
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(couleurCategorie)

            Text(subtitle)
                .font(.body)
                .padding()

            Spacer()

            PrimaryBtnView(
                label: "Retour",
                action: { dismiss() },
                color: .secondary,
                colorSecondary: .white,
                icon: "arrow.uturn.left"
            )
        }
        .padding()
    }
}

#Preview {
    EnduranceDescriptionView(name: "10K Run", subtitle: "Course de 10 kilomètres", couleurCategorie: .blue)
}
