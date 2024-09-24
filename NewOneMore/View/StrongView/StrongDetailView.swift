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
    @State private var showDeleteConfirmation: Bool = false
    @State private var showHistoryModal: Bool = false // State for showing modal
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
                                showDeleteConfirmation = true
                            }
                            .padding(.bottom, 20)
                            
                            BtnActionView(iconSF: "clock", color: strong.couleurCategorie) {
                                showHistoryModal = true // Show modal on clock button press
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

                ChartScoreView(scores: strong.scores, dates: strong.dates, couleurCategorie: strong.couleurCategorie)
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
        .alert(isPresented: $showDeleteConfirmation) {
            Alert(
                title: Text("Supprimer \(strong.nom) ?"),
                message: Text("Cette action est irréversible 😱"),
                primaryButton: .destructive(Text("Supprimer")) {
                    deleteMovement()
                },
                secondaryButton: .cancel(Text("Annuler"))
            )
        }
        .sheet(isPresented: $showHistoryModal) {
            ModalHistoryView(scores: strong.scores, dates: strong.dates, couleurCategorie: strong.couleurCategorie)
        }
    }

    func deleteMovement() {
        modelContext.delete(strong)
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la suppression : \(error.localizedDescription)")
        }
        dismiss()
    }

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
