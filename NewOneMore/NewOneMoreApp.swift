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
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                        // Basculer vers LandingScreenView après l'animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                showSplash = false // Cacher la SplashScreen après 4 secondes
                                handleAppOpen()
                            }
                        }
                    }
                    .statusBar(hidden: true)  // Cacher la Status Bar pendant la SplashScreen
            } else {
                RGPDAlertView()
                    .statusBar(hidden: true)  // Cacher la Status Bar aussi ici si nécessaire
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





