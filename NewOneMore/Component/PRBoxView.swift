//
//  PRBoxView.swift
//  NewOneMore
//
//  Created by dimitri on 23/09/2024.
//

import SwiftUI

struct PRBoxView: View {
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(color.opacity(0.3))
                .frame(width: 100, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color, lineWidth: 2)
                )
            
            VStack(spacing: 5) {
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                
                Text("\(value) Kg")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
        }
    }
}


#Preview {
    PRBoxView(title: "Plus petit PR", value: "454.4", color: .blue)
}
