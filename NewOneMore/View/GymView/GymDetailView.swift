//
//  GymDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//

//
//  GymDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//
import SwiftUI
import Charts

enum GymActiveSheet: Identifiable {
    case history, deleteConfirmation, description
    
    var id: Int {
        hashValue
    }
}

struct GymDetailView: View {
    let gym: Gym
    @Environment(\.dismiss) var dismiss
    @State private var newScore: String = ""
    @State private var showAlert: Bool = false
    @State private var activeSheet: GymActiveSheet? = nil
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                // Image et informations de base
                ZStack {
                    Image(gym.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .grayscale(1.0)
                        .clipped()
                    HStack {
                        ActionBtnView(icon: "arrow.left", color: gym.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(icon: "trash", color: gym.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .deleteConfirmation
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(icon: "list.star", color: gym.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .history
                            }
                        
                            
                         
                            .padding(.bottom, 20)
                            ActionBtnView(icon: "info.circle", color: gym.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .description
                            }
                            .padding(.bottom, 20)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, -30)
                    }
                    .foregroundStyle(gym.couleurCategorie)
                    VStack {
                        Text(gym.nom)
                            .font(.headline)
                            .fontWeight(.black)
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
                            .stroke(gym.couleurCategorie, lineWidth: 1)
                    )
                    .offset(y: 150)
                    .shadow(radius: 10, x: 0, y: 10)
                }
                Text("PR: \(String(format: "%.0f", gym.scores.max() ?? 0.0)) reps")
                    .font(Font.custom("edosz", size: 38 , relativeTo: .title))
                    .fontWeight(.black)
                    .foregroundStyle(gym.couleurCategorie)
                    .padding(.top, 40)

                StrongFieldAddScoreView(newScore: $newScore, strongColor: gym.couleurCategorie, addNewScore: addNewScore)

                GymChartScoreView(scores: gym.scores, dates: gym.dates, couleurCategorie: gym.couleurCategorie)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)

        // Gestion centralisée des modales via l'énumération ActiveSheet
        .sheet(item: $activeSheet) { item in
            switch item {
            case .history:
                GymModalHistoryView(name: gym.nom, scores: gym.scores, dates: gym.dates, couleurCategorie: gym.couleurCategorie, gym: gym)
            case .description:
                EnduranceDescriptionView(
                    name: gym.nom, subtitle: gym.subtitle,
                    couleurCategorie: gym.couleurCategorie
                )
            case .deleteConfirmation:
                deleteMovementAlert
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Es-tu sûr que ce score est possible ? 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    var deleteMovementAlert: some View {
        VStack {
            Text("Supprimer \(gym.nom) ?")
                .font(Font.custom("edosz", size: 24, relativeTo: .title))
            Text("Cette action est irréversible 😱")
                .padding(.bottom, 20)
                .foregroundStyle(.secondary)
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
            .shadow(radius: 10, x: 0, y: 10)
        }
        .frame(width: UIScreen.main.bounds.width * 0.7, height: 200)
    }

    func deleteMovement() {
        print("Tentative de suppression")
        modelContext.delete(gym)
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

        if score > 2000 {
            print("Le score est supérieur à 100, afficher l'alerte.")
            showAlert = true
        } else {
            let currentDate = Date()
            gym.addScore(score, date: currentDate)

            do {
                modelContext.insert(gym)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            newScore = ""
        }
    }
}




#Preview{
    GymDetailView(gym: Gym(nom: "Pull-Up", subtitle: "Un exercice de calisthénie classique pour la force du haut du corps.", image: "Pull-Up-Strict", descriptionName: "Un mouvement de base pour développer la force du dos et des bras.", scores: [10, 12, 15], dates: [now, now - oneDay, now - 2 * oneDay], categories: [.calisthenics]))
}
