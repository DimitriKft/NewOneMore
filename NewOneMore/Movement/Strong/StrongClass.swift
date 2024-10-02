//
//  Strong.swift
//  NewOneMore
//
//  Created by dimitri on 17/09/2024.
//
import SwiftData
import SwiftUI

enum Categories: String, Codable, CaseIterable {
    case halterophilie = "Haltérophilie"
    case musculation = "Musculation"
  
}

@Model
class Strong: ObservableObject {
    @Attribute var nom: String
    @Attribute var subtitle: String
    @Attribute var image: String
    @Attribute var descriptionName: String
    @Attribute var scores: [Double]
    @Attribute var dates: [Date]
    @Attribute var categories: [String]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, scores: [Double] = [], dates: [Date] = [], categories: [Categories] = [.halterophilie]) {
        self.nom = nom
        self.subtitle = subtitle
        self.image = image
        self.descriptionName = descriptionName
        self.scores = scores
        self.dates = dates
        self.categories = categories.map { $0.rawValue }
    }
    
    // Méthode pour ajouter un score avec une date et une catégorie
    func addScore(_ score: Double, date: Date) {
        self.scores.append(score)  // Ajoute le score à la liste des scores
        self.dates.append(date)    // Ajoute la date à la liste des dates
        // Ne rien faire avec la catégorie ici, elle est fixe pour le mouvement
    }

    
    // Méthode pour récupérer les catégories en tant qu'énumérations
    func getCategories() -> [Categories] {
        return self.categories.compactMap { Categories(rawValue: $0) }
    }
    
  
    
    
    var couleurCategorie: Color {
        guard let firstCat = getCategories().first else {
            return .gray
        }
        
        switch firstCat {
        case .halterophilie:
            return .yellow
        case .musculation:
            return .red
    
        }
    }
}
