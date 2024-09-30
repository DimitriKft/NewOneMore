//
//  EnduranceCardView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI

struct EnduranceCardView: View {
    var colorCategory: Color
    var image: String
    var nom: String
    var times: [Double] // En secondes
    var dates: [Date]
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(colorCategory)
                    .stroke(colorCategory, lineWidth: 1.5)
                    .frame(width: 165, height: 170)
                
                VStack {
                    Image(image)
                        .resizable()
                        .frame(width: 165, height: 110)
                        .grayscale(1.0)
                        .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 12))
                    Spacer()
                }
                .frame(width: 165, height: 170)
                
                VStack {
                    Text(nom.count > 16 ? "\(nom.prefix(18)).." : nom)
                        .font(.caption)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
                .frame(width: 300, height: 100)
                .background(
                    Color.white.opacity(0)
                        .background(BlurView())
                )
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
                .frame(width: 140, height: 32)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(colorCategory, lineWidth: 1)
                )
                .padding(.top, 45)
                
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 65, height: 28)
                            .cornerRadius(5)
                            .foregroundStyle(.ultraThickMaterial)
                            .opacity(0.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 0.6)
                                    .opacity(0.8)
                            )
                        HStack {
                            Image(systemName: "timer")
                                .font(.system(size: 10))
                            Text("\(formatTime(times.min() ?? 0.0))")
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 65, height: 28)
                            .cornerRadius(5)
                            .foregroundStyle(.ultraThickMaterial)
                            .opacity(0.4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 0.6)
                                    .opacity(0.8)
                            )
                        HStack {
                            Image(systemName: "calendar")
                                .font(.system(size: 10))
                            Text(daysSinceLastEntry())
                        }
                    }
                }
                .font(.system(size: 8))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.top, 120)
            }
        }
    }

    // Formatter le temps en minutes et secondes (mm:ss)
    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func daysSinceLastEntry() -> String {
        if let lastDate = dates.last {
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            let lastPRDate = calendar.startOfDay(for: lastDate) // Normaliser la date à minuit
            let components = calendar.dateComponents([.day], from: lastPRDate, to: today)
            
            if let days = components.day {
                return "\(days) J"
            }
        }
        return "N/A"
    }
}

#Preview {
    EnduranceCardView(colorCategory: .blue, image: "Run", nom: "10K Run", times: [3600, 3700, 3900], dates: [Date(), Date().addingTimeInterval(-86400), Date().addingTimeInterval(-172800)])
}
