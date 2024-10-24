//
//  SplashScreenView.swift
//  NewOneMore
//
//  Created by dimitri on 04/10/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var scale: CGFloat = 0.1
    @State private var rotation: Double = 0
    @State private var showText: Bool = false
    
    var body: some View {
        VStack {
            Text("+")
            .font(Font.custom("edosz", size: 150, relativeTo: .title))
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        scale = 1.5
                        rotation = 360
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.easeIn) {
                            showText = true
                        }
                    }
                }

            if showText {
                VStack {
                    Text("One-More")
                        .font(Font.custom("edosz", size: 70, relativeTo: .title))
                        .fontWeight(.black)
                        .fontWidth(.expanded)
                        .foregroundColor(.primary)
                        .transition(.opacity)
                    Text("Slogan")
                        .font(.system(size: 11))
                        .fontWeight(.regular)
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
