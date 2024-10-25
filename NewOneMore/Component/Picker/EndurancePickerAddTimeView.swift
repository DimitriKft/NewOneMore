//
//  EndurancePickerAddTimeView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI

struct EndurancePickerAddTimeView: View {
    @Binding var newTime: String
    var enduranceColor: Color
    var addNewTime: () -> Void

    
    @State private var selectedHours: Int = 0
    @State private var selectedMinutes: Int = 12
    @State private var selectedSeconds: Int = 24

    let hoursRange = Array(0...99)
    let minutesRange = Array(0...59)
    let secondsRange = Array(0...59)

    var body: some View {
        VStack {
            HStack {
                Picker(selection: $selectedHours, label: Text("Heures")) {
                    ForEach(hoursRange, id: \.self) { hour in
                        Text("\(hour) h")
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .background(enduranceColor)
                .cornerRadius(10)
                .clipped()

                Picker(selection: $selectedMinutes, label: Text("Minutes")) {
                    ForEach(minutesRange, id: \.self) { minute in
                        Text(String(format: "%02d min", minute))
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
                .background(enduranceColor)
                .cornerRadius(10)
                .clipped()

                Picker(selection: $selectedSeconds, label: Text("Secondes")) {
                    ForEach(secondsRange, id: \.self) { second in
                        Text(String(format: "%02d sec", second))
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
                .background(enduranceColor)
                .cornerRadius(10)
                .clipped()
            }
            .padding()
            Button(action: {
                newTime = formatTime(hours: selectedHours, minutes: selectedMinutes, seconds: selectedSeconds)
                addNewTime()
            }) {
                Text("Valider le temps")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(enduranceColor)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
        .background(
            BlurView()
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
        .padding()
        .cornerRadius(20)
        .padding()
    }


    func formatTime(hours: Int, minutes: Int, seconds: Int) -> String {
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    
    func formatDisplayTime() -> String {
        if newTime.isEmpty {
            return "HH : MM : SS"
        } else {
            return newTime 
        }
    }
}

#Preview {
    EndurancePickerAddTimeView(newTime: .constant("00:12:24"), enduranceColor: .blue, addNewTime: {
        print("Nouveau temps ajouté")
    })
}
