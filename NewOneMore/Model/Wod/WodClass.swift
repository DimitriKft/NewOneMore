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
    case open = "Open"
}

@Model
class Wod: ObservableObject {
    @Attribute var nom: String = ""
    @Attribute var subtitle: String = ""
    @Attribute var image: String = ""
    @Attribute var descriptionName: String = ""
    @Attribute var times: [Double] = [0.0]
    @Attribute var dates: [Date] = [Date.now]
    @Attribute var categories: [String] = [""]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, times: [Double] = [], dates: [Date] = [], categories: [WodCategories] = [.girl]) {
        self.nom = nom
        self.subtitle = subtitle
        self.image = image
        self.descriptionName = descriptionName
        self.times = times
        self.dates = dates
        self.categories = categories.map { $0.rawValue }
    }
    
    // Méthode pour ajouter un temps avec une date (sans toucher aux catégories)
    func addTime(_ time: Double, date: Date) {
        self.times.append(time)  
        self.dates.append(date)
    }

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
        case .open:
            return .brown
        }
    }
}
