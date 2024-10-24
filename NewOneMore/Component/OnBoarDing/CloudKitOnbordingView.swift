//
//  CloudKitOnbordingView.swift
//  NewOneMore
//
//  Created by dimitri on 22/10/2024.
//

import SwiftUI

struct CloudKitOnbordingView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            HStack {
                Text("Icloud")
                    .font(Font.custom("edosz", size: 24, relativeTo: .title))
                Image(systemName: "icloud.fill")
                    .font(.title)
            }
            .foregroundStyle(.black)

            Text("""
                        Pour garantir la persistanses de tes données, One More utilise **iCloud** pour sauvegarder automatiquement tes performances. Tu peux les retrouver à tout moment, sur tous tes appareils, même si tu changes de téléphone ou réinstalles l'app. **Tout est synchronisé et sous ton contrôle via ton compte iCloud**.
                        """)
            .font(.footnote)
            .padding()
          
            Text("+")
                .font(Font.custom("edosz", size: 100, relativeTo: .title))
        }
        .foregroundColor(.black)
        .frame(width: 300, height: 600)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    CloudKitOnbordingView()
}
