//
//  SplashScreenView.swift
//  NewOneMore
//
//  Created by dimitri on 04/10/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.colorScheme) var colorScheme // Accède au mode sombre ou clair
    @State private var scale: CGFloat = 0.1
    @State private var rotation: Double = 0
    @State private var showText: Bool = false
    
    var body: some View {
        VStack {
            Image(colorScheme == .dark ? "addMore" : "addMoreDark") // Change d'image selon le mode
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100) // Taille de départ de l'image
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        scale = 1.5 // Agrandissement de l'image
                        rotation = 360 // Rotation de 360 degrés
                    }
                    
                    // Affiche le texte après l'animation de l'image
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.easeIn) {
                            showText = true
                        }
                    }
                }
            
            if showText {
                VStack {
                    Text("One More")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .fontWidth(.expanded)
                        .foregroundColor(.primary)
                        .transition(.opacity)
                    Text("Slogan")
                        .font(.system(size: 11))
                        .fontWeight(.ultraLight)
                        .fontWidth(.expanded)
                        .transition(.opacity)
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
