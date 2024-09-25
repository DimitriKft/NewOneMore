//
//  SimpleBodyWeightDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI

struct SimpleBodyWeightDetailView: View {
    let bodyWeight: BodyWeight
    @State private var newScore: String = ""
    @State private var showAlert: Bool = false

    var body: some View {
        VStack {
            Text("PR: \(bodyWeight.scores.max() ?? 0) Répétitions")
                .font(.largeTitle)

            TextField("Entrez un score", text: $newScore)
                .keyboardType(.numberPad)
                .padding()

            Button("Ajouter Score") {
                addNewScore()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Pas si vite !"),
                    message: Text("Score trop élevé"),
                    dismissButton: .default(Text("D'accord"))
                )
            }
        }
    }

    func addNewScore() {
        guard let score = Int(newScore), score > 0 else {
            return
        }

        if score > 50 {
            showAlert = true
        } else {
            let currentDate = Date()
            bodyWeight.addScore(score, date: currentDate, categorie: .streetWorkout)
        }
    }
}


#Preview {
    SimpleBodyWeightDetailView(bodyWeight: BodyWeight(nom: "ezez", subtitle: "eze", image: "skull", descriptionName: "eeze"))
}
