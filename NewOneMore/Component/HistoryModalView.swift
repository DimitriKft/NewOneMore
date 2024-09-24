//
//  HistoryModalView.swift
//  NewOneMore
//
//  Created by dimitri on 24/09/2024.
//

import SwiftUI


struct HistoryModalView: View {
    let scores: [Double]
    let dates: [Date]
    let couleurCategorie: Color

    var body: some View {
            VStack {
                Text("Historique de tes RM en \(scores.count > 0 ? "Power-Clean" : "Mouvement")")
                    .font(.headline)
                    .foregroundColor(couleurCategorie)
                    .padding()

                List {
                    ForEach(Array(zip(scores, dates)), id: \.1) { score, date in
                        HStack {
                            Text("\(String(format: "%.2f", score)) Kg")
                                .foregroundColor(score == scores.max() ? .green : .primary)
                                .fontWeight(score == scores.max() ? .bold : .regular)

                            Spacer()

                            Text(formatDate(date))
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Button(action: {
                    dismiss()
                }) {
                    Text("Retour")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                }
            }
            .padding()
    
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }

    @Environment(\.dismiss) var dismiss
}


#Preview {
    HistoryModalView(scores: [23, 45, 56, 78, 90], dates: [Date(), Date(), Date(), Date(), Date()], couleurCategorie: .blue)
}
