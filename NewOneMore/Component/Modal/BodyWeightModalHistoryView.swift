//
//  BodyWeightModalHistoryView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//


import SwiftUI

struct BodyWeightModalHistoryView: View {
    var name: String
    let scores: [Int]
    let dates: [Date]
    let couleurCategorie: Color

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ActionBtnView(iconSF: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
            Text("Historique de tes RM en")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("\(name)")
                .font(.title)
                .foregroundColor(couleurCategorie)
                .fontWeight(.black)
                .fontWidth(.expanded)
                .padding(.top)
            
            ScrollView {
                VStack {
                    // Combine scores and dates, then sort by date descending
                    let sortedData = zip(scores, dates).sorted { $0.1 > $1.1 }

                    ForEach(sortedData, id: \.1) { score, date in
                        HStack {
                            if score == scores.max() {
                                // Display max score in green with a star icon
                                Text("\(String(format: "%.2f", score)) Kg")
                                    .foregroundColor(.green)
                                    .fontWeight(.bold)

                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.leading, 5)
                            } else {
                                // Normal score display
                                Text("\(String(format: "%.2f", score)) Kg")
                                    .foregroundColor(.primary)
                                    .fontWeight(.regular)
                            }

                            Spacer()

                            Text(formatDate(date))
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)

                        Rectangle()
                            .frame(height: 3)
                            .foregroundStyle(couleurCategorie)
                            .opacity(0.4)
                            .padding()
                    }
                }
            }
            .padding(.top, 30)

            PrimaryBtnView(
                label: "Retour",
                action: { dismiss() },
                color: .secondary,
                colorSecondary: .white,
                icon: "arrow.uturn.left"
            )
        }
        .padding(20)
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    BodyWeightModalHistoryView(name: "Clean", scores: [23, 45, 56, 78, 90], dates: [Date(), Date(), Date(), Date(), Date()], couleurCategorie: .blue)
}
