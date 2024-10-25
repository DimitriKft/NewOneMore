//
//  WelcomeOnBoardingView.swift
//  NewOneMore
//
//  Created by dimitri on 22/10/2024.
//

import SwiftUI

struct WelcomeOnBoardingView: View {
    @Binding var isOnboardingComplete: Bool
    var body: some View {
        VStack {
            Text(" Let's crush it !")
                .font(Font.custom("edosz", size: 18, relativeTo: .title))
            Text("Bienvenue sur One-More")
                .font(Font.custom("edosz", size: 24, relativeTo: .title))
            Text("""
Tu as entre les mains l'outil parfait pour garder une **trace de tes records et t'améliorer chaque jour**. Ton parcours vers de nouveaux **PR** commence ici, chaque session compte, alors donne tout à chaque séance !

 Tout est optimisé pour que tu puisses te **concentrer sur tes objectifs** et voir tes améliorations d'un coup d'œil !
""")
            .padding()
            .font(.footnote)
            

        }
        .foregroundStyle(.black)
        .frame(width: 300, height: 600)
        .cornerRadius(20)
   
        .padding()
    }
}

#Preview {
    WelcomeOnBoardingView(isOnboardingComplete: .constant(false))
}
