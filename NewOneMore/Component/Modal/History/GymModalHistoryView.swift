//
//  GymModalHistoryView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//


import SwiftUI
import SwiftData

struct GymModalHistoryView: View {
    var name: String
    @State var scores: [Double]
    @State var dates: [Date]
    let couleurCategorie: Color
    let gym: Gym

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var showDeleteAlert: Bool = false
    @State private var scoreToDeleteIndex: Int? = nil

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ActionBtnView(iconSF: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
            Text("Historique de tes PR en")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("\(name)")
                .font(Font.custom("edosz", size: 38 , relativeTo: .title))
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
                                Text("\(String(format: "%.2f", score)) reps")
                                    .foregroundColor(.green)
                                    .fontWeight(.bold)

                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.leading, 5)
                            } else {
                                Text("\(String(format: "%.2f", score)) reps")
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
        gym.scores.remove(at: index)
        gym.dates.remove(at: index)

        do {
            try modelContext.save()
            // Mettre à jour la vue après la suppression
            scores = gym.scores
            dates = gym.dates
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
    GymModalHistoryView(
        name: "Pull-Up",
        scores: [10, 12, 15, 18, 20],
        dates: [Date(), Date(), Date(), Date(), Date()],
        couleurCategorie: .yellow,
        gym: Gym(nom: "Pull-Up", subtitle: "Exercice de calisthénie", image: "Pull-Up-Strict", descriptionName: "Un exercice pour la force du haut du corps.", scores: [10, 12, 15, 18, 20], dates: [Date(), Date(), Date(), Date(), Date()], categories: [.calisthenics])
    )
}
