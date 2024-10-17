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
    @State private var activeSheet: ActiveSheet? = nil
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
                        .grayscale(1.0)
                        .clipped()
                    HStack {
                        ActionBtnView(icon: "arrow.left", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(icon: "trash", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .deleteConfirmation
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(icon: "list.star", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .history
                            }
                            .padding(.bottom, 20)
                            ActionBtnView(icon: "info.circle", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .description
                            }
                            .padding(.bottom, 20)
                            ActionBtnView(icon: "chart.bar", color: bodyWeight.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .calculator
                            }
                            .hidden()
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, -60)
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

//                BodyWeightChartScoreView(scores: bodyWeight.scores, dates: bodyWeight.dates, couleurCategorie: bodyWeight.couleurCategorie)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)

        // Gestion centralisée des modales via l'énumération ActiveSheet
        .sheet(item: $activeSheet) { item in
            switch item {
            case .calculator:
                StrongModalCalculatorView(pr: Double(bodyWeight.scores.max() ?? 0), color: bodyWeight.couleurCategorie, couleurCategorie: bodyWeight.couleurCategorie)
            case .history:
                BodyWeightModalHistoryView(name: bodyWeight.nom, scores: bodyWeight.scores, dates: bodyWeight.dates, bodyWeight: bodyWeight, couleurCategorie: bodyWeight.couleurCategorie)
            case .description:
                EnduranceDescriptionView(
                    name: bodyWeight.nom, subtitle: bodyWeight.subtitle,
                    couleurCategorie: bodyWeight.couleurCategorie
                )
            case .deleteConfirmation:
                deleteMovementAlert
            }
        }
        .alert(isPresented: $showwAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Le record du monde en pompes d'affiée de Carlton Williams est de 2682 répétitions ! On modifiera la limite quand tu lui arriveras à la cheville 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    var deleteMovementAlert: some View {
        VStack {
            Text("Supprimer \(bodyWeight.nom) ?")
                .font(.title)
            Text("Cette action est irréversible 😱")
                .padding(.bottom, 20)
            HStack {
                Button("Annuler") {
                    activeSheet = nil
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

                Button("Supprimer") {
                    deleteMovement()
                }
                .padding()
                .background(Color.red.opacity(0.8))
                .cornerRadius(8)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.7, height: 200)
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

        print("Score entré : \(score)")

        if score > 2682 {
            DispatchQueue.main.async {
                showwAlert = true
            }
        } else {
            let currentDate = Date()
            bodyWeight.addScore(score, date: currentDate)

            do {
                modelContext.insert(bodyWeight)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            newScore = ""
        }
    }
}


#Preview{
    BodyWeightDetailView(bodyWeight: BodyWeight(nom: "Pull-Up", subtitle: "Les tractions sont un exercice fondamental du street workout.", image: "Pull-Up", descriptionName: "Exercice de base", scores: [10, 12, 15, 18], dates: [now, now - oneDay, now - 2 * oneDay, now - 3 * oneDay], categories: [.calisthenics]))
}


