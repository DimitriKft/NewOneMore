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
    var body: some Scene {
        WindowGroup {
            LandingScreenView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: [Strong.self, BodyWeight.self]) 
    }
}
