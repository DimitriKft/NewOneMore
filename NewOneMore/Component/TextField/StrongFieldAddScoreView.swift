//
//  FieldAndBtnAddScoreView.swift
//  NewOneMore
//
//  Created by dimitri on 23/09/2024.
//

import SwiftUI

struct StrongFieldAddScoreView: View {
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
                                .keyboardType(.decimalPad)
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                if newScore.isEmpty {
                    Text("Entre ton score ici..")
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                }
            }
            .padding(.leading, 25)

            Button(action: {
                addNewScore()
                UIApplication.shared.endEditing()
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
                }
                .padding(.trailing, 25)
            }
        }
    }
}

#Preview {
    StrongFieldAddScoreView(
        newScore: .constant(""),
        strongColor: .yellow,
        addNewScore: {
            print("Score ajouté")
        }
    )
}



extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
