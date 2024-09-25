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
                          Label("Pdc", systemImage: "figure.play")
                      }

                  
              }
        .tint(.white)
    }
}

#Preview {
    LandingScreenView()
}
