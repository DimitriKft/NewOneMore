//
//  NewOneMoreApp.swift
//  NewOneMore
//
//  Created by dimitri on 17/09/2024.
//

import SwiftUI
import SwiftData

@main
struct OneMoreApp: App {
    @State private var showSplash = true
    var body: some Scene {
        WindowGroup {
                    if showSplash {
                        SplashScreenView()
                            .onAppear {
                                // Basculer vers LandingScreenView après l'animation
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    withAnimation {
                                        showSplash = false // Cacher la SplashScreen après 4 secondes
                                    }
                                }
                            }
                    } else {
                        RGPDAlertView()
                    }
                }
        .modelContainer(for: [Strong.self, Gym.self, Wod.self, Endurance.self])
    }
}
