//
//  EnduranceClass.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//


import SwiftData
import SwiftUI

enum EnduranceCategories: String, Codable, CaseIterable {
    case outdoor = "Outdoor"
    case indoor = "Indoor"
}

@Model
class Endurance: ObservableObject {
    @Attribute var nom: String = ""
    @Attribute var subtitle: String = ""
    @Attribute var image: String = ""
    @Attribute var descriptionName: String = ""
    @Attribute var times: [Double] = [0.0]
    @Attribute var dates: [Date] = [Date.now]
    @Attribute var categories: [String] = [""]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, times: [Double] = [], dates: [Date] = [], categories: [EnduranceCategories] = [.outdoor]) {
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
        self.times.append(time)  // Ajoute le temps à la liste des temps
        self.dates.append(date)  // Ajoute la date à la liste des dates
        // Ne rien faire avec la catégorie ici, elle est fixe pour chaque WOD
    }

    
    // Méthode pour récupérer les catégories en tant qu'énumérations
    func getCategories() -> [EnduranceCategories] {
        return self.categories.compactMap { EnduranceCategories(rawValue: $0) }
    }
    
    var couleurCategorie: Color {
        guard let firstCat = getCategories().first else {
            return .gray
        }
        
        switch firstCat {
        case .outdoor:
            return .orange
        case .indoor:
            return .blue
        }
    }
}
