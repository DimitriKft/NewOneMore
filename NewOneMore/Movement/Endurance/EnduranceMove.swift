//
//  EnduranceMove.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import Foundation

struct EnduranceMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: EnduranceCategories
}


var enduranceMoves: [EnduranceMove] = [
    // Outoor
    EnduranceMove(
        nom: "Marathon",
        subtitle: NSLocalizedString("Marathon", comment: ""),
        imageName: "Marathon",
        category: .outdoor),
    EnduranceMove(
        nom: "10K Run",
        subtitle: "",
        imageName: "10K-Run",
        category: .outdoor),
    EnduranceMove(nom: "5K Run", subtitle: "Course rapide de 5 kilomètres, souvent utilisée pour les courses locales.", imageName: "5K-Run", category: .outdoor),
    EnduranceMove(nom: "Half Marathon", subtitle: "Course de 21.1 kilomètres, un défi entre le 10K et le marathon complet.", imageName: "Half-Marathon", category: .outdoor),
    EnduranceMove(nom: "Sprint 400m", subtitle: "Course de 400 mètres, un test de vitesse sur une courte distance.", imageName: "Sprint-400m", category: .outdoor),
    EnduranceMove(nom: "Sprint 100m", subtitle: "Course de trail sur 50 kilomètres, combinant endurance et difficulté terrain.", imageName: "Sprint-100m", category: .outdoor),
    EnduranceMove(nom: "100m Crawl", subtitle: "Course de natation rapide de 100 mètres en crawl.", imageName: "100-metres-Crawl", category: .outdoor),
    EnduranceMove(nom: "200m Papillon", subtitle: "Épreuve exigeante de natation en style papillon sur 200 mètres.", imageName: "200m Papillon", category: .outdoor),
    EnduranceMove(nom: "1500m Natation", subtitle: "Course d'endurance en natation sur 1500 mètres, souvent en eau libre.", imageName: "1500-metres-Natation", category: .outdoor),
    EnduranceMove(nom: "50m-Dos", subtitle: "Course de natation rapide de 50 mètres en dos crawlé.", imageName: "50-metres-Dos", category: .outdoor),
    EnduranceMove(nom: "Ironman Swim", subtitle: "Épreuve de natation de 3.8 kilomètres dans la compétition d'Ironman.", imageName: "Ironman-Swim", category: .outdoor),

    
    // Indoor
    EnduranceMove(nom: "Assault Bike 100m", subtitle: "...", imageName: "assault-bike-100m", category: .indoor),
    
//    // Row (Aviron)
//    EnduranceMove(nom: "500-mètres-Row", subtitle: "Épreuve rapide d'aviron sur 500 mètres, souvent utilisée en CrossFit.", imageName: "500-metres-Row", category: .swim),
//    EnduranceMove(nom: "2000-mètres-Row", subtitle: "Distance classique en aviron, idéale pour tester l'endurance.", imageName: "2000-metres-Row", category: .swim),
//    EnduranceMove(nom: "5000-mètres-Row", subtitle: "Longue épreuve d'endurance en aviron sur 5000 mètres.", imageName: "5000-metres-Row", category: .swim),
//    
//    // Ski Erg
//    EnduranceMove(nom: "1000-mètres-SkiErg", subtitle: "Test d'endurance sur SkiErg, simulant une course de ski de fond.", imageName: "1000-metres-SkiErg", category: .run),
//    EnduranceMove(nom: "500-mètres-SkiErg", subtitle: "Distance rapide sur SkiErg, utilisée pour la puissance et la vitesse.", imageName: "500-metres-SkiErg", category: .run),
//    
//    // Bike Erg
//    EnduranceMove(nom: "10K-BikeErg", subtitle: "Course de 10 kilomètres sur BikeErg, simulant une course cycliste.", imageName: "10K-BikeErg", category: .run),
//    EnduranceMove(nom: "40K-BikeErg", subtitle: "Course plus longue de 40 kilomètres sur BikeErg, idéale pour l'endurance.", imageName: "40K-BikeErg", category: .run)
]
