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
                Text("Meilleur temps: \(formatTime(wod.times.min() ?? 0.0))")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(wod.couleurCategorie)
                    .padding(.top, 40)
                
                // ADAPTE
//                WodFieldAddTimeView(newTime: $newTime, wodColor: wod.couleurCategorie, addNewTime: addNewTime)

                
                // ADAPTE
//                WodChartTimeView(times: wod.times, dates: wod.dates, couleurCategorie: wod.couleurCategorie)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)

        // ADAPTE
//        .sheet(item: $activeSheet) { item in
//            switch item {
//            case .history:
//                WodModalHistoryView(name: wod.nom, times: wod.times, dates: wod.dates, couleurCategorie: wod.couleurCategorie)
//            case .deleteConfirmation:
//                deleteMovementAlert
//            }
//        }
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
        guard let time = Double(newTime), time > 0 else {
            print("Le temps entré n'est pas valide.")
            return
        }

        print("Temps entré : \(time)") // Vérifiez si le temps est correct

        if time < 200 { // Ex: limiter si temps trop court
            showAlert = true
        } else {
            let currentDate = Date()
            wod.addTime(time, date: currentDate, categorie: .hero) // Ajustez la catégorie si nécessaire

            do {
                modelContext.insert(wod)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }

            newTime = ""
        }
    }

    func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview{
    WodDetailView(wod: Wod(nom: "Murph", subtitle: "1 Mile Run, 100 Pull-ups, 200 Push-ups, 300 Squats, 1 Mile Run", image: "Murph", descriptionName: "Hero WOD", times: [3600, 4200, 4500], dates: [now, now - oneDay, now - 2 * oneDay], categories: [.hero]))
}
