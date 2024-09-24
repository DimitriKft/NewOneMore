//
//  ModalCalculatorView.swift
//  NewOneMore
//
//  Created by dimitri on 24/09/2024.
//

import SwiftUI

struct ModalCalculatorView: View {
    let pr: Double // Personal Record
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var percentage: Double = 100
    let couleurCategorie: Color
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                BtnActionView(iconSF: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
          
            Text("PR: \(String(format: "%.1f", pr)) Kg")
                .font(.title)
                .fontWeight(.bold)
         
            Text("\(Int(percentage)) % de ton 1RM :")
                .font(.headline)
                .padding(.top, 10)
            
            Text("\(String(format: "%.1f", calculatePercentage())) Kg")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(color)
                .padding(.bottom, 20)
            
            // Slider pour ajuster le pourcentage
            Slider(value: $percentage, in: 0...100, step: 1)
                .padding(.horizontal)
            
            Text("Estimation de tes RM")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text("Formule de Brzycki")
                .font(.caption)
                .padding(.bottom, 10)
            
            // Liste des estimations RM
            VStack(spacing: 10) {
                ForEach(2...7, id: \.self) { reps in
                    let estimatedRM = calculateRM(reps: reps)
                    HStack {
                        Text("\(reps) RM")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 70, alignment: .leading)
                        
                        Spacer()
                        
                        Text("\(String(format: "%.1f", estimatedRM)) Kg (\(Int((estimatedRM / pr) * 100))% de ton 1RM)")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(color)
                    .opacity(0.8)
                    .cornerRadius(10)
                    .animation(.easeInOut(duration: 0.2), value: percentage)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .tint(couleurCategorie)
        .padding()
    }
    
    // Calculer le pourcentage de la charge
    func calculatePercentage() -> Double {
        return pr * (percentage / 100)
    }
    
    // Calculer la charge pour un nombre donné de répétitions (Formule de Brzycki)
    func calculateRM(reps: Int) -> Double {
        // La formule originale de Brzycki pour estimer le 1RM
        let percentageRM = (1.0278 - (0.0278 * Double(reps)))
        return calculatePercentage() * percentageRM
    }
}

#Preview {
    ModalCalculatorView(pr: 112, color: .blue, couleurCategorie: .blue)
}
