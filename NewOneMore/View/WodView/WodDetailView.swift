//
//  WodDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//

import SwiftUI
import Charts

enum WodActiveSheet: Identifiable {
    case history, deleteConfirmation, description
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
    @State private var bestTime: Double?
    @State private var isPickerVisible: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                ZStack {
                    Image(wod.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .grayscale(1.0)
                        .clipped()
                    HStack {
                        ActionBtnView(icon: "arrow.left", color: wod.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(icon: "trash", color: wod.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .deleteConfirmation
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(icon: "list.star", color: wod.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .history
                            }
                            .padding(.bottom, 20)
                            ActionBtnView(icon: "info.circle", color: wod.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .description
                            }
                            .padding(.bottom, 20)
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                    }
                    .foregroundStyle(wod.couleurCategorie)
                    VStack {
                        Text(wod.nom)
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
                            .stroke(wod.couleurCategorie, lineWidth: 1)
                    )
                    .offset(y: 150)
                    .shadow(radius: 10, x: 0, y: 10)
                }
                
                Text("Meilleur temps")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(wod.couleurCategorie.secondary)
                    .padding(.top, 35)
                Text("\(formatTime(bestTime ?? wod.times.min() ?? 0.0))")
                    .font(Font.custom("edosz", size: 38 , relativeTo: .title))
                    .fontWeight(.black)
                    .foregroundStyle(wod.couleurCategorie)

                Text("Entre ton temps")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .padding(.top, 3)
                    .padding(.bottom, -15)
                Button(action: {
                    withAnimation {
                        isPickerVisible = true
                    }
                }) {
                    Text(newTime.isEmpty ? "HH : MM : SS" : newTime)
                        .font(.title)
                        .shadow(radius: 4)
                        .fontWeight(.bold)
        
                        .padding()
                        .background(wod.couleurCategorie)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 0, y: 10)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                WodChartTimeView(
                    times: wod.times,
                    dates: wod.dates,
                    couleurCategorie: wod.couleurCategorie
                )
                .padding(.bottom, 95)
            }
            if isPickerVisible {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isPickerVisible = false
                            }
                        }

                    VStack {
                        Spacer()
                        VStack {
                            WodPickerAddTimeView(newTime: $newTime, wodColor: wod.couleurCategorie) {
                                addNewTime()
                                withAnimation {
                                    isPickerVisible = false
                                }
                            }
                        }
                        .frame(width: 350, height: 350)

                        Spacer()
                    }
                    .transition(.move(edge: .bottom))
                }
                .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
        .onAppear {
            bestTime = wod.times.min()
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .history:
                WodHistoryView(
                    name: wod.nom,
                    times: wod.times,
                    dates: wod.dates,
                    couleurCategorie: wod.couleurCategorie,
                    wod: wod
                )
            case .description:
                WodDescriptionView(
                    name: wod.nom, subtitle: wod.subtitle,
                    couleurCategorie: wod.couleurCategorie
                )
            case .deleteConfirmation:
                deleteMovementAlert
            }
        }

        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Le record du monde pour le WOD Murph est impressionnant ! Tu pourras ajuster ce record quand tu t'en approcheras 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    func addNewTime() {
        guard let timeInSeconds = convertTimeToSeconds(newTime), timeInSeconds > 0 else {
            print("Le temps entré n'est pas valide.")
            return
        }

        if timeInSeconds < 200 {
            showAlert = true
        } else {
            let currentDate = Date()
            wod.addTime(timeInSeconds, date: currentDate)
            do {
                modelContext.insert(wod)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }
            bestTime = wod.times.min()
            newTime = ""
        }
    }

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
        
        if hours > 0 {
            return String(format: "%dH %02dmin %02dsec", hours, minutes, seconds)
        } else {
            return String(format: "%02dmin %02dsec", minutes, seconds)
        }
    }

    var deleteMovementAlert: some View {
        VStack {
            Text("Supprimer \(wod.nom) ?")
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
        modelContext.delete(wod)
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Erreur lors de la suppression : \(error.localizedDescription)")
        }
    }
}



#Preview{
    WodDetailView(wod: Wod(nom: "Murph", subtitle: "1 Mile Run, 100 Pull-ups, 200 Push-ups, 300 Squats, 1 Mile Run", image: "Murph", descriptionName: "Hero WOD", times: [3600, 4200, 4500], dates: [now, now - oneDay, now - 2 * oneDay], categories: [.hero]))
}

