//
//  WodHistoryView.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//

import SwiftUI
import SwiftData

struct WodHistoryView: View {
    var name: String
    @State var times: [Double]
    @State var dates: [Date]
    let couleurCategorie: Color
    let wod: Wod

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var showDeleteAlert: Bool = false
    @State private var timeToDeleteIndex: Int? = nil

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ActionBtnView(iconSF: "chevron.down.circle.fill", color: couleurCategorie, colorPrimary: .black, action: { dismiss() })
            }
            Text("Historique de tes WOD en")
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
                    // Combine times and dates, then sort by date descending
                    let sortedData = zip(times.indices, zip(times, dates)).sorted { $0.1.1 > $1.1.1 }

                    ForEach(sortedData, id: \.1.1) { index, data in
                        let (time, date) = data
                        
                        HStack {
                            if time == times.min() {
                                Text("\(formatTime(time))")
                                    .foregroundColor(.green)
                                    .fontWeight(.bold)

                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.leading, 5)
                            } else {
                                Text("\(formatTime(time))")
                                    .foregroundColor(.primary)
                                    .fontWeight(.regular)
                            }
                            
                            Spacer()

                            Text(formatDate(date))
                                .foregroundColor(.secondary)

                            // Delete button
                            Button(action: {
                                timeToDeleteIndex = index
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
                title: Text("Supprimer ce temps ?"),
                message: Text("Cette action est irréversible."),
                primaryButton: .destructive(Text("Supprimer")) {
                    if let index = timeToDeleteIndex {
                        deleteTime(at: index)
                    }
                },
                secondaryButton: .cancel(Text("Annuler"))
            )
        }
    }
    
    private func deleteTime(at index: Int) {
        // Suppression du temps et de la date dans les données persistantes
        wod.times.remove(at: index)
        wod.dates.remove(at: index)

        do {
            try modelContext.save()
            // Mettre à jour la vue après la suppression
            times = wod.times
            dates = wod.dates
        } catch {
            print("Erreur lors de la suppression du temps : \(error.localizedDescription)")
        }
    }

    private func formatTime(_ time: Double) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60

        if hours > 0 {
            return String(format: "%dH %02dmin %02dsec", hours, minutes, seconds)
        } else {
            return String(format: "%02dmin %02dsec", minutes, seconds)
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    WodHistoryView(name: "Murph", times: [3600, 4200, 4500], dates: [Date(), Date(), Date()], couleurCategorie: .purple, wod: Wod(nom: "Murph", subtitle: "1 Mile Run, 100 Pull-ups, 200 Push-ups, 300 Squats", image: "Murph", descriptionName: "Hero WOD", times: [3600, 4200, 4500], dates: [Date(), Date(), Date()], categories: [.hero]))
}
