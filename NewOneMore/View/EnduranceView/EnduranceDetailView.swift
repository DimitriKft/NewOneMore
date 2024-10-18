//
//  EnduranceDetailView.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import SwiftUI
import Charts

enum EnduranceActiveSheet: Identifiable {
    case history, deleteConfirmation, description
    var id: Int {
        hashValue
    }
}

struct EnduranceDetailView: View {
    let endurance: Endurance
    @Environment(\.dismiss) var dismiss
    @State private var newTime: String = ""
    @State private var showAlert: Bool = false
    @State private var activeSheet: EnduranceActiveSheet? = nil
    @Environment(\.modelContext) private var modelContext
    @State private var bestTime: Double?
    @State private var isPickerVisible: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                ZStack {
                    Image(endurance.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .grayscale(1.0)
                        .clipped()
                    HStack {
                        ActionBtnView(icon: "arrow.left", color: endurance.couleurCategorie, colorPrimary: .black) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
                        Spacer()
                        VStack {
                            ActionBtnView(icon: "trash", color: endurance.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .deleteConfirmation
                            }
                            .padding(.bottom, 20)
                            
                            ActionBtnView(icon: "list.star", color: endurance.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .history
                            }
                            .padding(.bottom, 20)
                            ActionBtnView(icon: "info.circle", color: endurance.couleurCategorie, colorPrimary: .black) {
                                activeSheet = .description
                            }
                            .padding(.bottom, 20)
                            .hidden()
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                    }
                    .foregroundStyle(endurance.couleurCategorie)
                    VStack {
                        Text(endurance.nom)
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
                            .stroke(endurance.couleurCategorie, lineWidth: 1)
                    )
                    .offset(y: 150)
                }
                
                Text("Meilleur temps")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(endurance.couleurCategorie.secondary)
                    .padding(.top, 35)
                Text("\(formatTime(bestTime ?? endurance.times.min() ?? 0.0))")
                    .font(Font.custom("edosz", size: 38 , relativeTo: .title))
                    .fontWeight(.black)
                    .foregroundStyle(endurance.couleurCategorie)
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
                        .shadow(radius: 10, x: 0, y: 10)
                        .fontWeight(.bold)
                       
                        .padding()
                        .background(endurance.couleurCategorie)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)

                EnduranceChartTimeView(
                    times: endurance.times,
                    dates: endurance.dates,
                    couleurCategorie: endurance.couleurCategorie
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
                            EndurancePickerAddTimeView(newTime: $newTime, enduranceColor: endurance.couleurCategorie) {
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
            bestTime = endurance.times.min()
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .history:
                EnduranceHistoryView(
                    name: endurance.nom,
                    times: endurance.times,
                    dates: endurance.dates,
                    couleurCategorie: endurance.couleurCategorie,
                    endurance: endurance
                )
            case .description:
                EnduranceDescriptionView(
                    name: endurance.nom, subtitle: endurance.subtitle,
                    couleurCategorie: endurance.couleurCategorie
                )
            case .deleteConfirmation:
                deleteMovementAlert
            }
        }

        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Pas si vite !"),
                message: Text("Le record du monde pour cette activité d'endurance est impressionnant ! Tu pourras ajuster ce record quand tu t'en approcheras 😅"),
                dismissButton: .default(Text("D'accord"))
            )
        }
    }

    func addNewTime() {
        guard let timeInSeconds = convertTimeToSeconds(newTime), timeInSeconds > 0 else {
            print("Le temps entré n'est pas valide.")
            return
        }

        if timeInSeconds < 1 {
            showAlert = true
        } else {
            let currentDate = Date()
            endurance.addTime(timeInSeconds, date: currentDate)
            do {
                modelContext.insert(endurance)
                try modelContext.save()
            } catch {
                print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
            }


            bestTime = endurance.times.min()
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
            Text("Supprimer \(endurance.nom) ?")
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
        modelContext.delete(endurance)
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Erreur lors de la suppression : \(error.localizedDescription)")
        }
    }
}


#Preview {
    EnduranceDetailView(
        endurance: Endurance(
            nom: "10K Run",
            subtitle: "Course de 10 kilomètres",
            image: "Run",
            descriptionName: "Course à pied",
            times: [3600, 3700, 3800],
            dates: [Date(), Date().addingTimeInterval(-86400), Date().addingTimeInterval(-172800)], 
            categories: [.outdoor]
        )
    )
}
