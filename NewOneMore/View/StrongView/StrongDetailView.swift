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
    @Environment(\.dismiss) var dismiss // Pour permettre le retour à la vue précédente
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 16) {
                // Image principale
                ZStack {
                    Image(strong.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                    // Bouton de retour au-dessus de l'image
                    HStack {
                        BackButton
                            .padding()
                            .padding(.bottom,150)
                        Spacer()
                        VStack {
                            BtnActionView(iconSF: "trash", color: strong.couleurCategorie) {
                                print("Trash action") // Action pour le bouton trash
                            }
                            .padding(.bottom, 20)
                            
                            BtnActionView(iconSF: "clock", color: strong.couleurCategorie) {
                                print("Clock action") // Action pour le bouton clock
                            }
                            .padding(.bottom, 20)
                            
                            BtnActionView(iconSF: "speedometer", color: strong.couleurCategorie) {
                                print("Speedometer action") // Action pour le bouton speedometer
                            }                            }
                        .padding(.trailing,20)
                        .padding(.bottom,10)
                    }
                    .foregroundStyle(strong.couleurCategorie)
                    VStack {
                        
                        Text(strong.nom)
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        Text(strong.subtitle)
                            .font(.caption2)
                            .fontWeight(.black)
                            .foregroundColor(.secondary)
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
                    .padding(20)
                    .foregroundStyle(.white)
                Spacer() // ⚠️⚠️ spacer a virer en fin de conception de vue
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top) // Ignorer les marges en haut pour que l'image occupe tout l'espace
    }
    
    // Fonction pour formater la date
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    // Bouton de retour personnalisé
    var BackButton: some View {
        Button(action: {
            dismiss() // Action de retour
        }) {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(strong.couleurCategorie)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(strong.couleurCategorie, lineWidth: 1)
            )
        }
    }
}






#Preview{
    StrongDetailView(strong: Strong(nom: "Clean", subtitle: "Epaul", image: "Clean", descriptionName: "L'un des mouvements de base du powerlifting, qui consiste à soulever une barre posée au sol.", scores: [90, 80, 70], dates: [Date(), Date(), Date()], categories: [.halterophilie]))
}


//                    // Sous-titre
//                    Text(strong.subtitle)
//                        .font(.title2)
//                        .foregroundColor(.gray)
//                        .padding(.horizontal)
//
//                    // Description
//                    Text(strong.descriptionName)
//                        .font(.body)
//                        .padding(.horizontal)
//
//                    // Score
//                    Text("Score: \(strong.scores.first ?? 0.0)")
//                        .font(.title2)
//                        .fontWeight(.medium)
//                        .padding(.horizontal)
//
//                    // Catégorie
//                    if let categorie = strong.categories.first {
//                        Text("Catégorie: \(categorie)")
//                            .font(.title3)
//                            .fontWeight(.medium)
//                            .padding(.horizontal)
//                    } else {
//                        Text("Catégorie: Inconnue")
//                            .font(.title3)
//                            .fontWeight(.medium)
//                            .padding(.horizontal)
//                    }

// Date d'ajout
//                    if let dateAjout = strong.dates.first {
//                        Text("Ajouté le: \(formatDate(dateAjout))")
//                            .font(.footnote)
//                            .foregroundColor(.gray)
//                            .padding(.horizontal)
//                    }
