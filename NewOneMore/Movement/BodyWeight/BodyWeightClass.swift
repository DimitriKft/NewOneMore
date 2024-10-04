//
//  BodyWeightClass.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//


import SwiftData
import SwiftUI

enum BodyWeightCategories: String, Codable, CaseIterable {
    case calisthenics = "Calisthénie"
    case gymnastique = "Gymnastique"
}

@Model
class BodyWeight: ObservableObject {
    @Attribute var nom: String = ""
    @Attribute var subtitle: String = ""
    @Attribute var image: String = ""
    @Attribute var descriptionName: String = ""
    @Attribute var scores: [Int] = [0]
    @Attribute var dates: [Date] = [Date.now]
    @Attribute var categories: [String] = [""]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, scores: [Int] = [], dates: [Date] = [], categories: [BodyWeightCategories] = [.calisthenics]) {
        self.nom = nom
        self.subtitle = subtitle
        self.image = image
        self.descriptionName = descriptionName
        self.scores = scores
        self.dates = dates
        self.categories = categories.map { $0.rawValue }
    }
    
    // Méthode pour ajouter un score avec une date (sans toucher aux catégories)
    func addScore(_ score: Int, date: Date) {
        self.scores.append(score)  // Ajoute le score à la liste des scores
        self.dates.append(date)    // Ajoute la date à la liste des dates
        // Ne rien faire avec la catégorie ici, elle reste fixe pour chaque mouvement
    }

    
    // Méthode pour récupérer les catégories en tant qu'énumérations
    func getCategories() -> [BodyWeightCategories] {
        return self.categories.compactMap { BodyWeightCategories(rawValue: $0) }
    }
    
    // Définir les couleurs des catégories
    var couleurCategorie: Color {
        guard let firstCat = getCategories().first else {
            return .gray
        }
        
        switch firstCat {
        case .calisthenics:
            return .mint
        case .gymnastique:
            return .indigo
        }
    }
}
