//
//  BlurCustomView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//
import SwiftUI

struct BlurView: View {
    var body: some View {
        VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
    }
}


struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

