//
//  BodyWeightFieldAddScoreView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI

struct BodyWeightFieldAddScoreView: View {
    @Binding var newScore: String
    var strongColor: Color
    var addNewScore: () -> Void

    var body: some View {
        HStack(spacing: 20) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 200, height: 60)
                    .foregroundStyle(strongColor)
                    .opacity(0.5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(strongColor, lineWidth: 2)
                    )
                TextField("", text: Binding(
                                    get: {
                                        self.newScore
                                    },
                                    set: { newValue in
                                        self.newScore = newValue.replacingOccurrences(of: ",", with: ".")
                                    }
                                ))
                .keyboardType(.numberPad)
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                if newScore.isEmpty {
                    Text("Entre ton 1RM ici..")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                }
            }
            .padding(.leading, 25)

            Button(action: {
                addNewScore()
                UIApplication.shared.endEditing() // Fermer le clavier après l'ajout
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 150, height: 60)
                        .foregroundStyle(strongColor)
                    HStack {
                        Image(systemName: "plus")
                        Text("Ajouter")
                    }
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }
                .padding(.trailing, 25)
            }
        }
    }
}

#Preview {
    BodyWeightFieldAddScoreView(
        newScore: .constant(""),
        strongColor: .yellow,
        addNewScore: {
            print("Score ajouté")
        }
    )
}



