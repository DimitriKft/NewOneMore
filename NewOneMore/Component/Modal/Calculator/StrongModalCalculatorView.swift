//
//  ModalCalculatorView.swift
//  NewOneMore
//
//  Created by dimitri on 24/09/2024.
//

import SwiftUI

struct StrongModalCalculatorView: View {
    let pr: Double // Personal Record
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var percentage: Double = 100
    let couleurCategorie: Color
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ActionBtnView(iconSF: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
            .padding(.top, 10)
          
            Text("PR: \(String(format: "%.1f", pr)) Kg")
                .font(.title)
                .fontWidth(.expanded)
                .fontWeight(.bold)
         
            HStack {
                Text(String(format: "%.0f", percentage) + " %")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                Text("de ton PR :")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.top)
            Text("\(String(format: "%.1f", calculatePercentage())) Kg")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(color)
                .padding(.bottom, 20)
            
            // Slider pour ajuster le pourcentage
            Slider(value: $percentage, in: 0...100, step: 5)
                .padding(.horizontal)
            
            Text("Estimation de tes RM")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text("Formule de Brzycki")
                .font(.caption)
                .padding(.bottom, 10)
            
            // Liste des estimations RM basées uniquement sur le PR
            VStack(spacing: 10) {
                ForEach(2...7, id: \.self) { reps in
                    let estimatedRM = calculateRMForPR(reps: reps) // Utilise directement le PR pour les calculs
                    HStack {
                        Text("\(reps) RM")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 70, alignment: .leading)
                        
                        Spacer()
                        
                        // Affichage de la valeur estimée pour les RM basés sur le PR
                        Text("\(String(format: "%d", Int(estimatedRM))) Kg (\(String(format: "%d", Int((estimatedRM / pr) * 100)))% de ton 1RM)")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(color)
                    .opacity(0.8)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .tint(couleurCategorie)
        .padding()
    }
    
    // Calculer le pourcentage de la charge ajustée par le curseur
    func calculatePercentage() -> Double {
        return pr * (percentage / 100)
    }
    
    // Calculer la charge pour un nombre donné de répétitions (Formule de Brzycki)
    // Basé uniquement sur le PR, sans tenir compte du pourcentage du curseur
    func calculateRMForPR(reps: Int) -> Double {
        // La formule originale de Brzycki pour estimer le 1RM
        let percentageRM = (1.0278 - (0.0278 * Double(reps)))
        return pr * percentageRM
    }
}

#Preview {
    StrongModalCalculatorView(pr: 112, color: .blue, couleurCategorie: .blue)
}
