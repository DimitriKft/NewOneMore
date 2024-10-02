//
//  LandingScreenView.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import SwiftUI

struct LandingScreenView: View {
    @Environment(\.colorScheme) var colorScheme // Détecte le mode clair ou sombre

    var body: some View {
        TabView {
            StrongListView()
                .tabItem {
                    Label("Force", systemImage: "figure.strengthtraining.traditional")
                }
            BodyWeightListView()
                .tabItem {
                    Label("Gym", systemImage: "figure.play")
                }
            WodListView()
                .tabItem {
                    Label("Wod", systemImage: "figure.cross.training")
                }
            EnduranceListView()
                .tabItem {
                    Label("Endurance", systemImage: "figure.run")
                }
        }
        .accentColor(colorScheme == .dark ? .white : .black) // Couleur des icônes et labels en fonction du mode
//        .background(colorScheme == .dark ? Color.black : Color.white) // Ajuste le fond
        .tint(colorScheme == .dark ? .white : .black) // Couleur d'accentuation (tint)
    }
}

#Preview {
    LandingScreenView()
}
