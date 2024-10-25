//
//  OnBoardingView.swift
//  NewOneMore
//
//  Created by dimitri on 22/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingComplete: Bool
    @State private var currentPage = 0
    @State private var animateButton = false

    var body: some View {
        ZStack {
            LandingScreenView()
                .blur(radius: 12)
                .allowsHitTesting(false)
            VStack {
                TabView(selection: $currentPage) {
                   
                    WelcomeOnBoardingView(isOnboardingComplete: $isOnboardingComplete)
                        .tag(0)

                    CloudKitOnbordingView(isOnboardingComplete: $isOnboardingComplete)
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(width: 300, height: 550)
                .background(Color.white)
                .cornerRadius(12)
               
           
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.black, lineWidth: 1)
                        .opacity(0.8)
                )
                .padding()
            }
        }
    }
}


#Preview{
    OnboardingView(isOnboardingComplete: .constant(false))
}
