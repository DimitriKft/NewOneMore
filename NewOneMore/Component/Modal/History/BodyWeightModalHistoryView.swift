//
//  BodyWeightModalHistoryView.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import SwiftUI
import SwiftData

struct BodyWeightModalHistoryView: View {
    var name: String
    @State var scores: [Int]
    @State var dates: [Date]
    let bodyWeight: BodyWeight
    let couleurCategorie: Color

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var showDeleteAlert: Bool = false
    @State private var scoreToDeleteIndex: Int? = nil

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ActionBtnView(icon: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
            Text("Historique de tes RM en")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("\(name)")
                .font(.title)
                .foregroundColor(couleurCategorie)
                .fontWeight(.black)
                .fontWidth(.expanded)
                .padding(.top)
            
            ScrollView {
                VStack {
                    // Combine scores and dates, then sort by date descending
                    let sortedData = zip(scores.indices, zip(scores, dates)).sorted { $0.1.1 > $1.1.1 }

                    ForEach(sortedData, id: \.1.1) { index, data in
                        let (score, date) = data
                        
                        HStack {
                            if score == scores.max() {
                                Text("\(score) Rep")
                                    .foregroundColor(.green)
                                    .fontWeight(.bold)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.leading, 5)
                            } else {
                                Text("\(score) Rep")
                                    .foregroundColor(.primary)
                                    .fontWeight(.regular)
                            }
                            
                            Spacer()

                            Text(formatDate(date))
                                .foregroundColor(.secondary)

                            // Delete button
                            Button(action: {
                                scoreToDeleteIndex = index
                                showDeleteAlert = true
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .padding(.leading, 5)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)

                        Rectangle()
                            .frame(height: 3)
                            .foregroundStyle(couleurCategorie)
                            .opacity(0.4)
                            .padding()
                    }
                }
            }
            .padding(.top, 30)

            PrimaryBtnView(
                label: "Retour",
                action: { dismiss() },
                color: .secondary,
                colorSecondary: .white,
                icon: "arrow.uturn.left"
            )
        }
        .padding(20)
        .alert(isPresented: $showDeleteAlert) {
            Alert(
                title: Text("Supprimer ce score ?"),
                message: Text("Cette action est irréversible."),
                primaryButton: .destructive(Text("Supprimer")) {
                    if let index = scoreToDeleteIndex {
                        deleteScore(at: index)
                    }
                },
                secondaryButton: .cancel(Text("Annuler"))
            )
        }
        
    }
    
    private func deleteScore(at index: Int) {
        // Suppression du score et de la date dans les données persistantes
        bodyWeight.scores.remove(at: index)
        bodyWeight.dates.remove(at: index)

        do {
            try modelContext.save()
            // Mettre à jour la vue après la suppression
            scores = bodyWeight.scores
            dates = bodyWeight.dates
        } catch {
            print("Erreur lors de la suppression du score : \(error.localizedDescription)")
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    BodyWeightModalHistoryView(name: "Pull-Up", scores: [23, 45, 56, 78, 90], dates: [Date(), Date(), Date(), Date(), Date()], bodyWeight: BodyWeight(nom: "Pull-Up", subtitle: "Exercice de base", image: "pull-up", descriptionName: "Pull-ups", scores: [23, 45, 56], dates: [Date(), Date(), Date()], categories: [.calisthenics]), couleurCategorie: .blue)
}
