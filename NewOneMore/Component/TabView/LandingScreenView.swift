//
//  LandingScreenView.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import SwiftUI

struct LandingScreenView: View {
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
        .tint(.white)
    }
}

#Preview {
    LandingScreenView()
}
