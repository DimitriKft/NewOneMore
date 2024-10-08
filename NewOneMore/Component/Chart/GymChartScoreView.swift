//
//  GymChartScoreView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//



import SwiftUI
import Charts

struct GymChartScoreView: View {
    let scores: [Double]
    let dates: [Date]
    let couleurCategorie: Color

    var body: some View {
        Chart {
            let lastFiveScores = Array(scores.suffix(5))
            let lastFiveDates = Array(dates.suffix(5))

            ForEach(Array(zip(lastFiveScores.indices, lastFiveScores)), id: \.0) { index, score in
                BarMark(
                    x: .value("Index", index),
                    y: .value("Score", score)
                )
                .foregroundStyle(couleurCategorie)
                .annotation(position: .top) {
                    Text(String(format: "%.0f", score) + " Reps")
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
        .chartYScale(domain: 0...((scores.max() ?? 0) + 10))
        .chartYAxis {
            AxisMarks(position: .leading) {
                AxisGridLine()
                AxisTick()
                AxisValueLabel ()
                .offset(x: -30)
            }
        }
        .chartXAxis {
            AxisMarks(position: .bottom) {
                AxisGridLine()
                AxisTick()
            }
        }
        .frame(height: 210)
        .padding(50)
    }
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}


#Preview {
    GymChartScoreView(scores: [23, 45, 56, 78, 90], dates: [Date(), Date(), Date(), Date(), Date()], couleurCategorie: .blue)
}

