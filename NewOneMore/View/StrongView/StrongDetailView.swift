//
//  ItemDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 18/09/2024.
//
import SwiftUI
import SwiftData

struct StrongDetailView: View {
    let strong: Strong
    @Environment(\.dismiss) var dismiss
    @State private var newScore: String = ""
    @State private var showAlert: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
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
                Text(strong.subtitle)
                    .font(.system(size: 13, weight: .medium))
                    .padding([.leading, .trailing, .top], 30)
                    .padding(.bottom, 10)
                    .foregroundStyle(.white)
                Text("PR: \(String(format: "%.1f", strong.scores.max() ?? 0.0)) Kg")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(strong.couleurCategorie)

                // Vue de champ et bouton
                FieldAndBtnAddScoreView(newScore: $newScore, strongColor: strong.couleurCategorie, addNewScore: addNewScore)
                
                HStack(spacing: 35) {
                            // Plus petit PR
                    PRBoxView(title: "Plus petit 1RM", value: String(format: "%.1f", strong.scores.min() ?? 0.0), color: strong.couleurCategorie)
                            
                            // Dernier PR (dernier entré dans la liste)
                    PRBoxView(title: "Dernier 1RM", value: String(format: "%.1f", strong.scores.last ?? 0.0), color: strong.couleurCategorie)
                            
                            // Meilleur PR (le plus grand score)
                    PRBoxView(title: "Meilleur 1RM", value: String(format: "%.1f", strong.scores.max() ?? 0.0), color: strong.couleurCategorie)
                        }
                .padding(.top,20)
                
                Spacer()

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
    

    func addNewScore() {
        guard let score = Double(newScore), score > 0 else { return }

      
        if score > 501 {
            showAlert = true
        } else {
            strong.addScore(score, date: Date(), categorie: .halterophilie)

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
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}




#Preview{
    StrongDetailView(strong: Strong(nom: "Clean", subtitle: "L’épaulé consiste à soulever une barre du sol jusqu’aux épaules en un mouvement explosif, sollicitant principalement les jambes et les bras.", image: "Clean", descriptionName: "L'un des mouvements de base du powerlifting, qui consiste à soulever une barre posée au sol.", scores: [90, 80, 70, 99, 45], dates: [Date(), Date(), Date()], categories: [.halterophilie]))
}


