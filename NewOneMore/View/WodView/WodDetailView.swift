//
//  WodDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//

import SwiftUI
import Charts

enum WodActiveSheet: Identifiable {
    case history, deleteConfirmation
    
    var id: Int {
        hashValue
    }
}

struct WodDetailView: View {
    let wod: Wod
    @Environment(\.dismiss) var dismiss
    @State private var newTime: String = ""
    @State private var showAlert: Bool = false
    @State private var activeSheet: WodActiveSheet? = nil
    @Environment(\.modelContext) private var modelContext

    // Variable pour garder une trace du meilleur temps
    @State private var bestTime: Double?

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                // Image et informations de base
                ZStack {
                    Image(wod.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                    HStack {
                        ActionBtnView(iconSF: "arrow.left", color: wod.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(iconSF: "trash", color: wod.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .deleteConfirmation
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(iconSF: "clock", color: wod.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .history
                            }
                            .padding(.bottom, 20)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                    }
                    .foregroundStyle(wod.couleurCategorie)
                    VStack {
                        Text(wod.nom)
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
                            .stroke(wod.couleurCategorie, lineWidth: 1)
                    )
                    .offset(y: 150)
                }
                
                Text("Meilleur temps")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(wod.couleurCategorie.secondary)
                    .padding(.top, 40)
                Text("\(formatTime(bestTime ?? wod.times.min() ?? 0.0))")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(wod.couleurCategorie)
           

                // Afficher le picker pour ajouter un temps
                WodPickerAddTimeView(newTime: $newTime, wodColor: wod.couleurCategorie) {
                    addNewTime()
                }

                // Vous pouvez également ajouter un graphique ici, si nécessaire.
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
        .onAppear {
            // Mettre à jour le meilleur temps au chargement de la vue
            bestTime = wod.times.min()
        }

        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Le record du monde pour le WOD Murph est impressionnant ! Tu pourras ajuster ce record quand tu t'en approcheras 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    var deleteMovementAlert: some View {
        VStack {
            Text("Supprimer \(wod.nom) ?")
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
        modelContext.delete(wod)
        do {
            try modelContext.save()
            print("Suppression réussie")
        } catch {
            print("Erreur lors de la suppression : \(error.localizedDescription)")
        }
        dismiss()
    }

    func addNewTime() {
        // Conversion du temps en secondes (ici il est supposé en secondes, mais ajustez si nécessaire)
        guard let timeInSeconds = convertTimeToSeconds(newTime), timeInSeconds > 0 else {
            print("Le temps entré n'est pas valide.")
            return
        }

        // Condition pour valider le temps entré
        if timeInSeconds < 200 { // Ex: limiter si temps trop court
            showAlert = true
        } else {
            let currentDate = Date()
            wod.addTime(timeInSeconds, date: currentDate, categorie: .hero) // Ajustez la catégorie si nécessaire

            // Sauvegarde dans le modèle WOD
            do {
                modelContext.insert(wod)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            // Mettre à jour le meilleur temps
            bestTime = wod.times.min()

            // Réinitialiser le champ de temps
            newTime = ""
        }
    }

    // Fonction pour convertir un temps au format "HH:mm:ss" en secondes
    func convertTimeToSeconds(_ time: String) -> Double? {
        let timeComponents = time.split(separator: ":").map { Double($0) ?? 0 }
        if timeComponents.count == 3 {
            let hours = timeComponents[0]
            let minutes = timeComponents[1]
            let seconds = timeComponents[2]
            return (hours * 3600) + (minutes * 60) + seconds
        }
        return nil
    }

    func formatTime(_ time: Double) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        
        // Si moins d'une heure, on affiche juste minutes:secondes
        if hours > 0 {
            return String(format: "%dH %02dmin %02dsec", hours, minutes, seconds)
        } else {
            return String(format: "%02dmin %02dsec", minutes, seconds)
        }
    }

}

#Preview{
    WodDetailView(wod: Wod(nom: "Murph", subtitle: "1 Mile Run, 100 Pull-ups, 200 Push-ups, 300 Squats, 1 Mile Run", image: "Murph", descriptionName: "Hero WOD", times: [3600, 4200, 4500], dates: [now, now - oneDay, now - 2 * oneDay], categories: [.hero]))
}
