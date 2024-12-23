//
//  WodDescriptionView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//

import SwiftUI

struct WodDescriptionView: View {
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
        }
        .padding()
    }
}

#Preview {
    WodDescriptionView(name: "Murph", subtitle: "1 Mile Run, 100 Pull-ups, 200 Push-ups, 300 Squats, 1 Mile Run", couleurCategorie: .green)
}
