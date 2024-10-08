//
//  ItemDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 18/09/2024.
//
import SwiftUI
import Charts

enum ActiveSheet: Identifiable {
    case calculator, history, deleteConfirmation, description
    
    var id: Int {
        hashValue
    }
}

struct StrongDetailView: View {
    let strong: Strong
    @Environment(\.dismiss) var dismiss
    @State private var newScore: String = ""
    @State private var showAlert: Bool = false
    @State private var activeSheet: ActiveSheet? = nil
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                // Image et informations de base
                ZStack {
                    Image(strong.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .grayscale(1.0)
                        .clipped()
                    HStack {
                        ActionBtnView(iconSF: "arrow.left", color: strong.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(iconSF: "trash", color: strong.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .deleteConfirmation
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(iconSF: "list.star", color: strong.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .history
                            }
                            .padding(.bottom, 20)
                            ActionBtnView(iconSF: "info.circle", color: strong.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .description
                            }
                            .padding(.bottom, 20)
                            ActionBtnView(iconSF: "chart.bar", color: strong.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .calculator
                            }
                            .padding(.bottom, 20)
                            .opacity(strong.scores.isEmpty ? 0 : 1)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, -80)

                    }
                    .foregroundStyle(strong.couleurCategorie)
                    VStack {
                        Text(strong.nom)
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
                            .stroke(strong.couleurCategorie, lineWidth: 1)
                    )
                    .offset(y: 150)
                }
                Text("PR: \(String(format: "%.1f", strong.scores.max() ?? 0.0)) Kg")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(strong.couleurCategorie)
                    .padding(.top, 40)

                StrongFieldAddScoreView(newScore: $newScore, strongColor: strong.couleurCategorie, addNewScore: addNewScore)

                StrongChartScoreView(scores: strong.scores, dates: strong.dates, couleurCategorie: strong.couleurCategorie)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
        .sheet(item: $activeSheet) { item in
            switch item {
            case .calculator:
                StrongModalCalculatorView(pr: strong.scores.max() ?? 0.0, color: strong.couleurCategorie, couleurCategorie: strong.couleurCategorie)
            case .history:
                StrongModalHistoryView(name: strong.nom, scores: strong.scores, dates: strong.dates, couleurCategorie: strong.couleurCategorie, strong: strong)
            case .description:
                EnduranceDescriptionView(
                    name: strong.nom, subtitle: strong.subtitle,
                    couleurCategorie: strong.couleurCategorie
                )
            case .deleteConfirmation:
                deleteMovementAlert
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Le record du monde en deadlift de Hafþór Júlíus Björnsson est de 501 Kg ! On modifiera la limite quand tu lui arriveras à la cheville 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    var deleteMovementAlert: some View {
        VStack {
            Text("Supprimer \(strong.nom) ?")
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
        print("Tentative de suppression")
        modelContext.delete(strong)
        do {
            try modelContext.save()
            print("Suppression réussie")
        } catch {
            print("Erreur lors de la suppression : \(error.localizedDescription)")
        }
        dismiss()
    }

    func addNewScore() {
        guard let score = Double(newScore), score > 0 else {
            print("Le score entré n'est pas valide.")
            return
        }

        print("Score entré : \(score)") // Vérifiez si le score est correct

        if score > 501 {
            print("Le score est supérieur à 501, afficher l'alerte.")
            showAlert = true
        } else {
            let currentDate = Date()
            strong.addScore(score, date: currentDate)

            do {
                modelContext.insert(strong)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            newScore = ""
        }
    }
}


let now = Date()
let oneDay: TimeInterval = 60 * 60 * 24

#Preview{
    StrongDetailView(strong: Strong(nom: "Clean", subtitle: "L’épaulé consiste à soulever une barre du sol jusqu’aux épaules en un mouvement explosif, sollicitant principalement les jambes et les bras.", image: "Clean", descriptionName: "L'un des mouvements de base du powerlifting, qui consiste à soulever une barre posée au sol.", scores: [90, 80, 70, 99, 105, 112], dates: [now, now - oneDay, now - 2 * oneDay, now - 3 * oneDay, now - 4 * oneDay, now - 5 * oneDay], categories: [.halterophilie]))
}
