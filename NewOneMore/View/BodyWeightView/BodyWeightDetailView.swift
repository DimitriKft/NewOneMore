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
    @State private var showAlert: Bool = false
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
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Là, c'est ton maximum pour ce mouvement 💪"),
                dismissButton: .default(Text("D'accord"))
            )
        }


        .alert(isPresented: $showDeleteConfirmation) {
            Alert(
                title: Text("Supprimer \(bodyWeight.nom) ?"),
                message: Text("Cette action est irréversible 😱"),
                primaryButton: .destructive(Text("Supprimer")) {
                    deleteMovement()
                },
                secondaryButton: .cancel(Text("Annuler"))
            )
        }
        .sheet(isPresented: $showHistoryModal) {
            BodyWeightModalHistoryView(name: bodyWeight.nom, scores: bodyWeight.scores, dates: bodyWeight.dates, couleurCategorie: bodyWeight.couleurCategorie)
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

//    func adddNewScore() {
//        guard let score = Int(newScore), score > 0 else {
//            print("Le score entré n'est pas un nombre valide ou est négatif.")
//            return
//        }
//
//        print("Score entré : \(score)")
//
//        if score > 2682 {
//            print("Le score est supérieur à 2682, l'alerte doit s'afficher.")
//            DispatchQueue.main.async {
//                self.showAlert = true
//            }
//        } else {
//            let currentDate = Date()
//            print("Ajout du score \(score) à la date \(currentDate)")
//            bodyWeight.addScore(score, date: currentDate, categorie: .streetWorkout)
//
//            do {
//                print("Tentative de sauvegarde du score")
//                modelContext.insert(bodyWeight)
//                try modelContext.save()
//                print("Score sauvegardé avec succès.")
//            } catch {
//                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
//            }
//
//            newScore = ""
//        }
//    }
    
    func addNewScore() {
        guard let score = Int(newScore), score > 0 else { // Utilisation d'Int au lieu de Double
            print("Le score entré n'est pas valide.") // Si la conversion échoue
            return
        }

        print("Score entré : \(score)") // Affiche le score pour vérifier

        if score > 2682 {
            print("Le score est supérieur à 2682, afficher l'alerte.")
            showAlert = true
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

            newScore = "" // Réinitialiser le champ de score
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
