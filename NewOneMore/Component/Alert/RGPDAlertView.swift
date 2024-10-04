//
//  RGPDAlertView.swift
//  NewOneMore
//
//  Created by dimitri on 04/10/2024.
//

import SwiftUI

struct RGPDAlertView: View {
    @State private var showWelcomeMessage: Bool = false
    
    var body: some View {
        LandingScreenView()
            .onAppear {
                if !UserDefaults.standard.bool(forKey: "hasSeenWelcomeMessage") {
                    showWelcomeMessage = true
                }
            }
            .alert(isPresented: $showWelcomeMessage) {
                Alert(
                    title: Text("Bienvenue dans One More"),
                    message: Text("Pour sauvegarder vos mouvements et scores de manière sécurisée, One More utilise iCloud."),
                    dismissButton: .default(Text("Compris"), action: {
                        UserDefaults.standard.set(true, forKey: "hasSeenWelcomeMessage")
                    })
                )
            }
    }
}

#Preview {
    RGPDAlertView()
}
