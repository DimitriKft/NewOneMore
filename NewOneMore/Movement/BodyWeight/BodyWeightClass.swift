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
    @Attribute var nom: String
    @Attribute var subtitle: String
    @Attribute var image: String
    @Attribute var descriptionName: String
    @Attribute var scores: [Int]
    @Attribute var dates: [Date]
    @Attribute var categories: [String]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, scores: [Int] = [], dates: [Date] = [], categories: [BodyWeightCategories] = [.calisthenics]) {
        self.nom = nom
        self.subtitle = subtitle
        self.image = image
        self.descriptionName = descriptionName
        self.scores = scores
        self.dates = dates
        self.categories = categories.map { $0.rawValue }
    }
    
    // Méthode pour ajouter un score avec une date et une catégorie
    func addScore(_ score: Int, date: Date, categorie: BodyWeightCategories) {
        self.scores.append(score)
        self.dates.append(date)
        let categorieString = categorie.rawValue
        if !self.categories.contains(categorieString) {
            self.categories.append(categorieString)
        }
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
            return .purple
        }
    }
}
