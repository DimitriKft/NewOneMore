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
    
   
    func localizedName() -> String {
          switch self {
          case .halterophilie:
              return NSLocalizedString("Haltérophilie", comment: "Catégorie d'haltérophilie")
          case .musculation:
              return NSLocalizedString("Musculation", comment: "Catégorie de musculation")
          }
      }
  
}

@Model
class Strong: ObservableObject {
    @Attribute var nom: String = ""
    @Attribute var subtitle: String = ""
    @Attribute var image: String = ""
    @Attribute var descriptionName: String =   ""
    @Attribute var scores: [Double] = [0.0]
    @Attribute var dates: [Date] = [Date.now]
    @Attribute var categories: [String] = [""]
    
    init(nom: String, subtitle: String, image: String, descriptionName: String, scores: [Double] = [], dates: [Date] = [], categories: [Categories] = [.halterophilie]) {
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

