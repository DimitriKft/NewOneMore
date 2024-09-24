//
//  ItemDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 18/09/2024.
//

import SwiftUI
import Charts

struct StrongDetailView: View {
    let strong: Strong
    @Environment(\.dismiss) var dismiss
    @State private var newScore: String = ""
    @State private var showAlert: Bool = false
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
                        .clipped()
                    HStack {
                        BtnActionView(iconSF: "arrow.left", color: strong.couleurCategorie) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            BtnActionView(iconSF: "trash", color: strong.couleurCategorie) {
                                print("Trash action")
                            }
                            .padding(.bottom, 20)
                            
                            BtnActionView(iconSF: "clock", color: strong.couleurCategorie) {
                                print("Clock action")
                            }
                            .padding(.bottom, 20)
                            
                            BtnActionView(iconSF: "speedometer", color: strong.couleurCategorie) {
                                print("Speedometer action")
                            }
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
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

                FieldAndBtnAddScoreView(newScore: $newScore, strongColor: strong.couleurCategorie, addNewScore: addNewScore)
//
//                HStack(spacing: 35) {
//                                            // Plus petit PR
//                                    PRBoxView(title: "Plus petit 1RM", value: String(format: "%.1f", strong.scores.min() ?? 0.0), color: strong.couleurCategorie)
//                                            
//                                            // Dernier PR (dernier entré dans la liste)
//                                    PRBoxView(title: "Dernier 1RM", value: String(format: "%.1f", strong.scores.last ?? 0.0), color: strong.couleurCategorie)
//                                            
//                                            // Meilleur PR (le plus grand score)
//                                    PRBoxView(title: "Meilleur 1RM", value: String(format: "%.1f", strong.scores.max() ?? 0.0), color: strong.couleurCategorie)
//                                        }
//                                .padding(.top,20)
    
                
                Chart {
                    let lastFiveScores = Array(strong.scores.suffix(5))
                    let lastFiveDates = Array(strong.dates.suffix(5))

                    ForEach(Array(zip(lastFiveScores.indices, lastFiveScores)), id: \.0) { index, score in
                        BarMark(
                            x: .value("Index", index),
                            y: .value("Score", score)
                        )
                        .foregroundStyle(strong.couleurCategorie)

                        // Annotation pour afficher le score au-dessus de la barre
                        .annotation(position: .top) {
                            Text(String(format: "%.1f", score))  // Afficher le score
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }

                        // Annotation pour afficher la date en bas de la barre
                        .annotation(position: .bottom) {
                            Text(formatDate(lastFiveDates[index]))  // Afficher la date associée
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .chartXScale(domain: 0...4)  // Limite l'axe X à 5 entrées (indices de 0 à 4)
                .chartYScale(domain: 0...((strong.scores.max() ?? 0) + 10))  // Limite l'axe Y à 0 - max score
                .chartYAxis {
                    AxisMarks(position: .leading) {
                        AxisGridLine()  // Affiche uniquement la grille verticale
                        AxisTick()      // Ticks sur l'axe Y
                        // Pas d'AxisValueLabel ici pour éviter les numérotations
                    }
                }
                .chartXAxis {
                    AxisMarks(position: .bottom) {
                        AxisGridLine()  // Grille horizontale
                        AxisTick()      // Ticks sur l'axe X
                    }
                }
                .frame(height: 210)
                .padding(50)


            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Le record du monde en deadlift de Hafþór Júlíus Björnsson est de 501 Kg ! On modifira la limite quand tu lui arriveras à la cheville 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    // Fonction pour ajouter un nouveau score
    func addNewScore() {
        guard let score = Double(newScore), score > 0 else { return }

        if score > 501 {
            showAlert = true
        } else {
            let currentDate = Date()
            strong.addScore(score, date: currentDate, categorie: .halterophilie)
            
            do {
                modelContext.insert(strong)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            newScore = ""
        }
    }


    // Formater la date pour le graphique
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
let now = Date()
let oneDay: TimeInterval = 60 * 60 * 24

#Preview{
    StrongDetailView(strong: Strong(nom: "Clean", subtitle: "L’épaulé consiste à soulever une barre du sol jusqu’aux épaules en un mouvement explosif, sollicitant principalement les jambes et les bras.", image: "Clean", descriptionName: "L'un des mouvements de base du powerlifting, qui consiste à soulever une barre posée au sol.", scores: [90, 80, 70, 99, 105, 112], dates: [now, now - oneDay, now - 2 * oneDay, now - 3 * oneDay, now - 4 * oneDay, now - 5 * oneDay], categories: [.halterophilie]))
}
