//
//  EnduranceChartTimeView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI
import Charts

struct EnduranceChartTimeView: View {
    let times: [Double]
    let dates: [Date]
    let couleurCategorie: Color

    var body: some View {
        Chart {
            let lastFiveTimes = Array(times.suffix(5))
            let lastFiveDates = Array(dates.suffix(5))

            ForEach(Array(zip(lastFiveTimes.indices, lastFiveTimes)), id: \.0) { index, time in
                LineMark(
                    x: .value("Index", index),
                    y: .value("Time", time)
                )
                .foregroundStyle(couleurCategorie)
                .symbol(.circle)
                .annotation(position: .top, alignment: .center) {
                    // Affiche le temps au-dessus de chaque point
                    Text(formatTime(time))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .annotation(position: .bottom) {
                    Text(formatDate(lastFiveDates[index]))
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
        }
        .chartXScale(domain: 0...4)
        .chartYScale(domain: 0...((times.max() ?? 0) + 600)) // Ajustement de l'échelle pour inclure des temps plus longs
        .chartYAxis {
            AxisMarks(position: .leading) {
                AxisGridLine()
                AxisTick()
            }
        }
        .chartXAxis {
            AxisMarks(position: .bottom) {
                AxisGridLine()
                AxisTick()
            }
        }
        .frame(height: 170)
        .padding(.horizontal, 30) // Ajout de marge sur les côtés
    }
    
    // Fonction pour formater les temps en HH:mm ou mm:ss selon la durée
    private func formatTime(_ time: Double) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60

        // Si le temps est supérieur à une heure, afficher heures et minutes, sinon minutes et secondes
        if hours > 0 {
            return String(format: "%02dh%02dm", hours, minutes)
        } else {
            return String(format: "%02dm%02ds", minutes, seconds)
        }
    }

    // Fonction pour formater les dates
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    EnduranceChartTimeView(times: [3600, 3650, 5400, 6000, 7200], dates: [Date(), Date().addingTimeInterval(-86400), Date().addingTimeInterval(-172800), Date().addingTimeInterval(-259200), Date().addingTimeInterval(-345600)], couleurCategorie: .blue)
}
