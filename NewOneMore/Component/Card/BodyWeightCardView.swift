//
//  BodyWeightCardView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI

struct BodyWeightCardView: View {
    var colorCategory: Color
    var image: String
    var nom: String
    var scores: [Int]
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
                        .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 12))
                    Spacer()
                }
                .frame(width: 165, height: 170)
                
                VStack {
                    Text(nom.count > 16 ? "\(nom.prefix(16)).." : nom)
                        .font(.system(size: 12))
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
                            Image(systemName: "flame.fill")
                                .font(.system(size: 10))
                            Text("\(scores.max() ?? 0) Rep")
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
    BodyWeightCardView(colorCategory: .blue, image: "Kipping-Bar-Muscle-Up", nom: "Kipping-Bar-Muscle-Up", scores: [2, 80, 90], dates: [Date(), Date().addingTimeInterval(-86400), Date().addingTimeInterval(-172800)])
}

