//
//  TipsOnboardingView.swift
//  NewOneMore
//
//  Created by dimitri on 23/10/2024.
//

import SwiftUI

struct TipsOnboardingView: View {
    @Binding var isOnboardingComplete: Bool
    var body: some View {
        VStack {
            Text("Choisis, Enregistre, Dépasse-Toi !")
                .font(Font.custom("edosz", size: 18, relativeTo: .title))
            Text("""
 Dans chaque catégorie, tu peux facilement ajouter le mouvement de ton choix en appuyant sur le **"+"** en haut à droite. Une fois le mouvement sélectionné, il te suffit d'entrer ton nouveau score. Seuls les mouvements que tu as déjà effectués s'afficheront, pour te permettre une meilleure lecture de ta progression et un suivi clair de tes performances au fil du temps.

 Tout est optimisé pour que tu puisses te concentrer sur tes objectifs et voir tes améliorations d'un coup d'œil !
""")
            .padding()
            .font(.footnote)
           
            Button(action: {
                isOnboardingComplete = true
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.black, lineWidth: 1)
                                .opacity(0.8)
                        )
                        .padding()
                    HStack {
                        Text("+")
                            .font(Font.custom("edosz", size: 30, relativeTo: .title))
                      
                        Text("Commencer")
                        
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                }
               
                .padding(.bottom,60)
            })

        }
        .foregroundStyle(.black)
        .frame(width: 300, height: 600)
//        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    TipsOnboardingView(isOnboardingComplete: .constant(false))
}
