//
//  HistoryModalView.swift
//  NewOneMore
//
//  Created by dimitri on 24/09/2024.
//

import SwiftUI
import SwiftData

struct StrongModalHistoryView: View {
    var name: String
    @State var scores: [Double]
    @State var dates: [Date]
    let couleurCategorie: Color
    let strong: Strong

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
                .font(Font.custom("edosz", size: 38 , relativeTo: .title))
                .foregroundColor(couleurCategorie)
                .fontWeight(.black)
                .fontWidth(.expanded)
                .padding(.top)
            
            ScrollView {
                VStack {
                    let sortedData = zip(scores.indices, zip(scores, dates)).sorted { $0.1.1 > $1.1.1 }

                    ForEach(sortedData, id: \.1.1) { index, data in
                        let (score, date) = data
                        
                        HStack {
                            if score == scores.max() {
                                Text("\(String(format: "%.2f", score)) Kg")
                                    .foregroundColor(.green)
                                    .fontWeight(.bold)

                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.leading, 5)
                            } else {
                                Text("\(String(format: "%.2f", score)) Kg")
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
        strong.scores.remove(at: index)
        strong.dates.remove(at: index)

        do {
            try modelContext.save()
            scores = strong.scores
            dates = strong.dates
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
    StrongModalHistoryView(name: "Clean", scores: [23, 45, 56, 78, 90], dates: [Date(), Date(), Date(), Date(), Date()], couleurCategorie: .blue, strong: Strong(nom: "Clean", subtitle: "Exercice de force", image: "clean", descriptionName: "Clean", scores: [23, 45, 56, 78, 90], dates: [Date(), Date(), Date(), Date(), Date()], categories: [.halterophilie]))
}
