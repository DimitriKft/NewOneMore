//
//  BodyWeightDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI
import Charts

struct BodyWeightDetailView: View {
    let bodyWeight: BodyWeight
    @Environment(\.dismiss) var dismiss
    @State private var newScore: String = ""
    @State private var showwAlert: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    @State private var showCalculatorModal: Bool = false
    @State private var showHistoryModal: Bool = false // State for showing modal
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                // Image et informations de base
                ZStack {
                    
                    Image(bodyWeight.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                    HStack {
                        ActionBtnView(iconSF: "arrow.left", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(iconSF: "trash", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                showDeleteConfirmation = true
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(iconSF: "clock", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                showHistoryModal = true // Show modal on clock button press
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(iconSF: "chart.bar.fill", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                showCalculatorModal = true
                            }
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                    }
                    .foregroundStyle(bodyWeight.couleurCategorie)
                    VStack {
                        Text(bodyWeight.nom)
                            .font(.headline)
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
                    .frame(width: 220, height: 55)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(bodyWeight.couleurCategorie, lineWidth: 1)
                    )
                    .offset(y: 150)
                }
                Text("PR: \(bodyWeight.scores.max() ?? 0) Répétitions")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(bodyWeight.couleurCategorie)
                    .padding(.top, 40)

                BodyWeightFieldAddScoreView(newScore: $newScore, strongColor: bodyWeight.couleurCategorie, addNewScore: addNewScore)

                BodyWeightChartScoreView(scores: bodyWeight.scores, dates: bodyWeight.dates, couleurCategorie: bodyWeight.couleurCategorie)
            }
        }
       

        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $showCalculatorModal) {
            ModalCalculatorView(pr: Double(bodyWeight.scores.max() ?? 0), color: bodyWeight.couleurCategorie, couleurCategorie: bodyWeight.couleurCategorie)
        }
        .alert(isPresented: Binding(
            get: {
                showwAlert || showDeleteConfirmation
            },
            set: { newValue in
                showwAlert = newValue
                showDeleteConfirmation = newValue
            }
        )) {
            if showwAlert {
                return Alert(
                    title: Text("Pas si vite !"),
                    message: Text("Le record du monde en pompes d'affiée de Carlton Williams  est de 2682 répétitions ! On modifiera la limite quand tu lui arriveras à la cheville 😅"),
                    dismissButton: .default(Text("D'accord")) {
                        showwAlert = false
                    }
                )
            } else if showDeleteConfirmation {
                return Alert(
                    title: Text("Supprimer \(bodyWeight.nom) ?"),
                    message: Text("Cette action est irréversible 😱"),
                    primaryButton: .destructive(Text("Supprimer")) {
                        deleteMovement()
                    },
                    secondaryButton: .cancel(Text("Annuler")) {
                        showDeleteConfirmation = false
                    }
                )
            } else {
                return Alert(title: Text("Erreur"))
            }
        }

    }

    func deleteMovement() {
        modelContext.delete(bodyWeight)
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la suppression : \(error.localizedDescription)")
        }
        dismiss()
    }


    
    func addNewScore() {
        guard let score = Int(newScore), score > 0 else {
            print("Le score entré n'est pas valide.")
            return
        }

        print("Score entré : \(score)") // Affiche le score pour vérifier

        if score > 2682 {
            // Utilisation de DispatchQueue pour forcer la mise à jour sur le thread principal
            DispatchQueue.main.async {
                showwAlert = true
            }
        } else {
            let currentDate = Date()
            bodyWeight.addScore(score, date: currentDate, categorie: .streetWorkout) // Pas besoin de convertir

            do {
                modelContext.insert(bodyWeight) // Insérer l'objet dans le contexte
                try modelContext.save() // Sauvegarder dans le modèle
                print("Score sauvegardé avec succès.")
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            newScore = "" // Réinitialiser après l'ajout
        }
    }





    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
//
//let now = Date()
//let oneDay: TimeInterval = 60 * 60 * 24

#Preview{
    BodyWeightDetailView(bodyWeight: BodyWeight(nom: "Pull-Up", subtitle: "Les tractions sont un exercice fondamental du street workout.", image: "Pull-Up", descriptionName: "Exercice de base", scores: [10, 12, 15, 18], dates: [now, now - oneDay, now - 2 * oneDay, now - 3 * oneDay], categories: [.streetWorkout]))
}


import SwiftUI

struct TestAlertView: View {
    @State private var showAlert: Bool = false

    var body: some View {
        VStack {
            Button("Test Alert") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Test"),
                    message: Text("Ceci est un test d'alerte."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct TestAlertView_Previews: PreviewProvider {
    static var previews: some View {
        TestAlertView()
    }
}
