//
//  CloudKitOnbordingView.swift
//  NewOneMore
//
//  Created by dimitri on 22/10/2024.
//

import SwiftUI

struct CloudKitOnbordingView: View {
    @Binding var isOnboardingComplete: Bool
    var body: some View {
        VStack {
            HStack {
                Text("Icloud")
                    .font(Font.custom("edosz", size: 24, relativeTo: .title))
                Image(systemName: "icloud.fill")
                    .font(.title)
            }
            .foregroundStyle(.black)

            Text("""
                        Pour garantir la persistanses de tes données, One More utilise **iCloud** pour sauvegarder automatiquement tes performances. Tu peux les retrouver à tout moment, sur tous tes appareils, même si tu changes de téléphone ou réinstalles l'app. **Tout est synchronisé et sous ton contrôle via ton compte iCloud**.
                        """)
            .font(.footnote)
            .padding()
  
            Button {
                isOnboardingComplete = true
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 270, height: 50)
                        .foregroundColor(.black)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.black, lineWidth: 1)
                                .opacity(0.8)
                        )
                        .padding()
                    HStack {
                        
                        Text("Commencer")

                            .fontWeight(.bold)
                        Image("arrow.left")
                            .resizable()
                            .frame(width: 30, height: 20)
                            .scaleEffect(x: -1, y: 1)
                      
                         
                    }
                    .foregroundStyle(.white)
                }
               
                .padding(.bottom,60)
            }
            
        }
        .foregroundColor(.black)
        .frame(width: 300, height: 600)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    CloudKitOnbordingView(isOnboardingComplete: .constant(false))
}
