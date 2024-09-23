//
//  ContentView.swift
//  NewOneMore
//
//  Created by dimitri on 17/09/2024.
//
import SwiftUI
import SwiftData

struct StrongListView: View {
    @Query var strongs: [Strong]
    @State private var showingAddItemView = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(strongs, id: \.nom) { strong in
                        NavigationLink(destination: StrongDetailView(strong: strong)) {
                            CardView(colorCategory: strong.couleurCategorie, image: strong.image, nom: strong.nom, scores: strong.scores, dates: strong.dates)
                        }
                    }
                }
                .padding(.all, 16)
            }
            .navigationTitle("Force")
            .navigationBarItems(trailing: Button(action: {
                showingAddItemView = true
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            })
            .sheet(isPresented: $showingAddItemView) {
                // Passer les mouvements déjà sélectionnés à la vue d'ajout
                AddItemView(selectedStrongs: strongs.map { $0.nom })
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}


#Preview {
    StrongListView()
        .modelContainer(for: Strong.self)
}
