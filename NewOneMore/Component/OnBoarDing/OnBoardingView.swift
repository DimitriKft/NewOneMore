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
//        .overlay(
//                    Button(action: {
//                        isOnboardingComplete = true
//                    }, label: {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 12)
//                                .frame(width: 150, height: 50)
//                                .foregroundColor(.white)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 12)
//                                        .stroke(.black, lineWidth: 1)
//                                        .opacity(0.8)
//                                )
//                                .padding()
//
//                            Text("Commencer")
//                                .fontWeight(.bold)
//                                .foregroundStyle(.black)
//                        }
//                        .scaleEffect(animateButton ? 1.1 : 1.0)
//                        .opacity(animateButton ? 1.0 : 0.8)
//                        .padding(.bottom, 60)
//                    })
//                    .onAppear {
//                        withAnimation(
//                            Animation.easeInOut(duration: 1.0)
//                                .repeatForever(autoreverses: true)) {
//                                    animateButton = true
//                                }
//                    },
//                    alignment: .bottomTrailing
//                )
//                .animation(.easeInOut, value: currentPage)
    }
}


#Preview{
    OnboardingView(isOnboardingComplete: .constant(false))
}
