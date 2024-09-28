//
//  WodFieldAddScoreView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//

import SwiftUI

struct WodFieldAddTimeView: View {
    @Binding var newTime: String
    var wodColor: Color
    var addNewTime: () -> Void

    // Etat pour les heures, minutes et secondes
    @State private var selectedHours: Int = 0
    @State private var selectedMinutes: Int = 12
    @State private var selectedSeconds: Int = 24

    // Plages de valeurs pour le picker
    let hoursRange = Array(0...3)
    let minutesRange = Array(0...59)
    let secondsRange = Array(0...59)

    var body: some View {
        VStack {
            // Pickers pour heures, minutes et secondes
            HStack {
                Picker(selection: $selectedHours, label: Text("Heures")) {
                    ForEach(hoursRange, id: \.self) { hour in
                        Text("\(hour) H")
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .background(wodColor)
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
                .background(wodColor)
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
                .background(wodColor)
                .cornerRadius(10)
                .clipped()
            }
            .padding()

            // Bouton pour valider le temps sélectionné
            Button(action: {
                // Formater le temps sélectionné en texte
                let formattedTime = formatTime(hours: selectedHours, minutes: selectedMinutes, seconds: selectedSeconds)
                newTime = formattedTime
                addNewTime() // Appel de la fonction d'ajout de temps
            }) {
                Text("Valider le temps")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(wodColor)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .background(wodColor.opacity(0.9))
        .cornerRadius(20)
        .padding()
    }

    // Fonction pour formater le temps
    func formatTime(hours: Int, minutes: Int, seconds: Int) -> String {
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    WodFieldAddTimeView(newTime: .constant("00:12:24"), wodColor: .purple, addNewTime: {
        print("Nouveau temps ajouté")
    })
}
