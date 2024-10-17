//
//  BodyWeightModalCalculatorView.swift
//  NewOneMore
//
//  Created by dimitri on 27/09/2024.
//

import SwiftUI
// VUE EN SUSPENS
struct BodyWeightModalCalculatorView: View {
    let pr: Int // Personal Record
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var percentage: Double = 100
    let couleurCategorie: Color
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                ActionBtnView(icon: "close", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
          
            Text("PR: \(pr) Rep")
                .font(.title)
                .fontWeight(.bold)
         
            Text("\(Int(percentage)) % de ton 1RM :")
                .font(.headline)
                .padding(.top, 10)
                .padding()
            Text("\(String(calculatePercentage())) Rep")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(color)
                .padding(.bottom, 20)
            
            // Slider pour ajuster le pourcentage
            Slider(value: $percentage, in: 0...100, step: 1)
                .padding(.horizontal)
        
            
            Spacer()
        }
        .tint(couleurCategorie)
        .padding()
    }
    
    // Calculer le pourcentage de la charge
    func calculatePercentage() -> Int {
        return pr * (Int(percentage) / 100)
    }
    
 
}

#Preview {
    BodyWeightModalCalculatorView(pr: 112, color: .blue, couleurCategorie: .blue)
}
