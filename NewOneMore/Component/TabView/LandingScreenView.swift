//
//  LandingScreenView.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import SwiftUI

struct LandingScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            StrongListView()
                .tabItem {
                    Label("Force", systemImage: "figure.strengthtraining.traditional")
                }
            GymListView()
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
        .accentColor(colorScheme == .dark ? .white : .black) 
        .tint(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    LandingScreenView()
}
