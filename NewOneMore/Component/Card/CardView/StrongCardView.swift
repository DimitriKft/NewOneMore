//
//  CardView.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import SwiftUI

struct StrongCardView: View {
    var colorCategory: Color
    var image: String
    var nom: String
    var scores: [Double]
    var dates: [Date]
    
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(colorCategory)
                    .stroke(colorCategory, lineWidth: 1.5)
                    .frame(width: 165, height: 170)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                      .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                      .shadow(color: .black.opacity(0.05), radius: 10, x: 5, y: 0)
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
                        .font(.system(size: 12))
                        .fontWeight(.black)
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
                .frame(width: 157, height: 32)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(colorCategory, lineWidth: 1)
                )
                .padding(.top, 45)
                
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 75, height: 28)
                            .cornerRadius(5)
                            .foregroundStyle(.ultraThickMaterial)
                            .opacity(0.7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(colorCategory, lineWidth: 0.6)
                                    .opacity(0.8)
                            )
                        HStack {
                            Image(systemName: "flame.fill")
                                .font(.system(size: 10))
                            Text("\(String(format: "%.1f", scores.max() ?? 0.0)) Kg")
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 75, height: 28)
                            .cornerRadius(5)
                            .foregroundStyle(.ultraThickMaterial)
                            .opacity(0.7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(colorCategory, lineWidth: 0.6)
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
                .padding(.top, 120)
            }
        }
       
    }

   
    private func daysSinceLastEntry() -> String {
        if let lastDate = dates.last {
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            let lastPRDate = calendar.startOfDay(for: lastDate) 
            let components = calendar.dateComponents([.day], from: lastPRDate, to: today)
            
            if let days = components.day {
                return "\(days) J"
            }
        }
        return ".."
    }

}


#Preview {
    StrongCardView(colorCategory: .yellow, image: "Clean", nom: "Squat", scores: [2.3, 80.5, 90.1], dates: [Date(), Date().addingTimeInterval(-86400), Date().addingTimeInterval(-172800)])
}







