//
//  GymClass.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//


import SwiftData
import SwiftUI

enum GymCategories: String, Codable, CaseIterable {
    case calisthenics = "Calisthénie"
    case gymnastique = "Gymnastique"
    
    // Méthode pour obtenir une chaîne localisée
    func localizedName() -> String {
          switch self {
          case .calisthenics:
              return NSLocalizedString("Calisthénie", comment: "Catégorie de calisthenics")
          case .gymnastique:
              return NSLocalizedString("Gymnastique", comment: "Catégorie de gymnastique")
          }
      }
}

@Model
class Gym: ObservableObject {
    @Attribute var nom: String = ""
    @Attribute var subtitle: String = ""
    @Attribute var image: String = ""
    @Attribute var descriptionName: String =   ""
    @Attribute var scores: [Double] = [0.0]
    @Attribute var dates: [Date] = [Date.now]
    @Attribute var categories: [String] = [""]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, scores: [Double] = [], dates: [Date] = [], categories: [GymCategories] = [.calisthenics]) {
        self.nom = nom
        self.subtitle = subtitle
        self.image = image
        self.descriptionName = descriptionName
        self.scores = scores
        self.dates = dates
        self.categories = categories.map { $0.rawValue }
    }
    
    
    func addScore(_ score: Double, date: Date) {
        self.scores.append(score)
        self.dates.append(date)
    }

    
    func getCategories() -> [GymCategories] {
        return self.categories.compactMap { GymCategories(rawValue: $0) }
    }
    
  
    
    
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

