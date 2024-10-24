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
                    message: Text("""
                        Pour garantir la sécurité et la persistance de vos mouvements et scores, One More utilise iCloud pour sauvegarder automatiquement vos données. 

                        Cela vous permet de retrouver vos performances à tout moment, même si vous changez d'appareil ou réinstallez l'application. Vos données sont synchronisées sur tous vos appareils via votre compte iCloud et sont sous votre contrôle.

                        Si vous souhaitez en savoir plus sur la manière dont vos données sont traitées et sauvegardées, veuillez consulter notre politique de confidentialité sur www.01-more.com/conditions. Vous pouvez également gérer vos données iCloud via les paramètres de votre appareil.
                        """),
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
