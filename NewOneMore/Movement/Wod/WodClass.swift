//
//  WodClass.swift
//  NewOneMore
//
//  Created by dimitri on 27/09/2024.
//


import SwiftData
import SwiftUI

enum WodCategories: String, Codable, CaseIterable {
    case girl = "Girl"
    case hero = "Hero"
}

@Model
class Wod: ObservableObject {
    @Attribute var nom: String
    @Attribute var subtitle: String
    @Attribute var image: String
    @Attribute var descriptionName: String
    @Attribute var times: [Double] // En secondes
    @Attribute var dates: [Date]
    @Attribute var categories: [String]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, times: [Double] = [], dates: [Date] = [], categories: [WodCategories] = [.girl]) {
        self.nom = nom
        self.subtitle = subtitle
        self.image = image
        self.descriptionName = descriptionName
        self.times = times
        self.dates = dates
        self.categories = categories.map { $0.rawValue }
    }
    
    // Méthode pour ajouter un temps avec une date et une catégorie
    func addTime(_ time: Double, date: Date, categorie: WodCategories) {
        self.times.append(time)
        self.dates.append(date)
        let categorieString = categorie.rawValue
        if !self.categories.contains(categorieString) {
            self.categories.append(categorieString)
        }
    }
    
    // Méthode pour récupérer les catégories en tant qu'énumérations
    func getCategories() -> [WodCategories] {
        return self.categories.compactMap { WodCategories(rawValue: $0) }
    }
    
    var couleurCategorie: Color {
        guard let firstCat = getCategories().first else {
            return .gray
        }
        
        switch firstCat {
        case .girl:
            return .purple
        case .hero:
            return .green
        }
    }
}
