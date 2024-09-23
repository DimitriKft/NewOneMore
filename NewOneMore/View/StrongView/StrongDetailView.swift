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
    @State private var nouveauScore: String = ""
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                // Image principale
                ZStack {
                    Image(strong.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                    
                    // Bouton de retour au-dessus de l'image
                    HStack {
                        BtnActionView(iconSF: "arrow.left", color: strong.couleurCategorie) {
                            dismiss()
                        }
                        .padding()
                        .padding(.bottom, 150)
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
                    .padding(30)
                    .foregroundStyle(.white)
                Text("PR: \(Int(strong.scores.max() ?? 0.0)) Kg")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(strong.couleurCategorie)

                VStack(spacing: 20) {
                    TextField("Entre ton 1RM ici..", text: $nouveauScore)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    // Bouton pour ajouter le nouveau score
                    Button(action: {
                        ajouterNouveauScore()
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Ajouter")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(strong.couleurCategorie)
                        .cornerRadius(8)
                    }
                    .disabled(nouveauScore.isEmpty) // Désactiver si le champ est vide
                    
                    Spacer() // ⚠️⚠️ Spacer à ajuster en fin de conception de vue
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(edges: .top)
    }
    
    // Méthode pour ajouter un nouveau score
    func ajouterNouveauScore() {
        guard let score = Double(nouveauScore), score > 0 else { return } // Assurez-vous que le score est un nombre valide supérieur à 0
        
        // Ajoutez le score au modèle Strong
        strong.addScore(score, date: Date(), categorie: .halterophilie) // Vous pouvez adapter la catégorie ici si nécessaire
        
        // Sauvegarder les changements dans SwiftData
        do {
            modelContext.insert(strong) // Insérer dans le contexte SwiftData
            try modelContext.save() // Sauvegarder les modifications
        } catch {
            print("Erreur lors de la sauvegarde des données : \(error.localizedDescription)")
        }
        
        // Réinitialiser le champ de texte
        nouveauScore = ""
    }
    
    // Fonction pour formater la date
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}


#Preview{
    StrongDetailView(strong: Strong(nom: "Clean", subtitle: "L’épaulé consiste à soulever une barre du sol jusqu’aux épaules en un mouvement explosif, sollicitant principalement les jambes et les bras.", image: "Clean", descriptionName: "L'un des mouvements de base du powerlifting, qui consiste à soulever une barre posée au sol.", scores: [90, 80, 70, 99], dates: [Date(), Date(), Date()], categories: [.halterophilie]))
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
