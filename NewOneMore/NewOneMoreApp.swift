//
//  NewOneMoreApp.swift
//  NewOneMore
//
//  Created by dimitri on 17/09/2024.
//

import SwiftUI
import SwiftData
import StoreKit

@main
struct OneMoreApp: App {
    @State private var showSplash = true
    @AppStorage("hasRated") private var hasRated: Bool = false
    @AppStorage("appOpenCount") private var appOpenCount: Int = 0
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                        // Basculer vers l'écran d'onboarding après l'animation de splash
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                showSplash = false
                                handleAppOpen()
                            }
                        }
                    }
                    .statusBar(hidden: true)
            } else {
                if !hasCompletedOnboarding {
                    // Afficher l'onboarding seulement si il n'a pas été complété
                    OnboardingView(isOnboardingComplete: $hasCompletedOnboarding)
                        .statusBar(hidden: true)
                } else {
                    // Afficher l'écran principal si l'onboarding est terminé
                    LandingScreenView()
                        .statusBar(hidden: false)
                }
            }
        }
        .modelContainer(for: [Strong.self, Gym.self, Wod.self, Endurance.self])
    }
    
    func handleAppOpen() {
        appOpenCount += 1

        guard !hasRated else { return }

        if appOpenCount == 3 || (appOpenCount > 3 && appOpenCount % 5 == 0) {
            promptForReview()
        }
    }

    func promptForReview() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if #available(iOS 18.0, *) {
                AppStore.requestReview(in: windowScene)
            } else {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        }
    }
}





