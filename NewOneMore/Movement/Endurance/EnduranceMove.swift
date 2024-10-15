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
    // OUTDOOR
    //Run
    EnduranceMove(
        nom: "Marathon",
        subtitle: NSLocalizedString("Marathon", comment: ""),
        imageName: "Marathon",
        category: .outdoor),
    EnduranceMove(
        nom: "10K Run",
        subtitle: NSLocalizedString("10KRun", comment: ""),
        imageName: "10K-Run",
        category: .outdoor),
    EnduranceMove(
        nom: "5K Run",
        subtitle: "",
        imageName: "5K-Run",
        category: .outdoor),
    EnduranceMove(
        nom: "Half Marathon",
        subtitle: "",
        imageName: "Half-Marathon",
        category: .outdoor),
    EnduranceMove(
        nom: "Sprint 400m",
        subtitle: "",
        imageName: "Sprint-400m",
        category: .outdoor),
    EnduranceMove(
        nom: "Sprint 100m",
        subtitle: "",
        imageName: "Sprint-100m",
        category: .outdoor),
    EnduranceMove(
        nom: "Sprint 200m",
        subtitle: "",
        imageName: "Sprint-200m",
        category: .outdoor),
    EnduranceMove(
        nom: "15K Run",
        subtitle: "",
        imageName: "15K-Run",
        category: .outdoor),
    EnduranceMove(
        nom: "20K Run",
        subtitle: "",
        imageName: "20K-Run",
        category: .outdoor),

  

    // Velo
    EnduranceMove(
        nom: "Contre-la-montre 5 km",
        subtitle: "",
        imageName: "Contre-la-montre-5km",
        category: .outdoor),
    EnduranceMove(
        nom: "Contre-la-montre 10 km",
        subtitle: "",
        imageName: "Contre-la-montre-10km",
        category: .outdoor),
    EnduranceMove(
        nom: "Contre-la-montre 20 km",
        subtitle: "",
        imageName: "Contre-la-montre-20km",
        category: .outdoor),
    EnduranceMove(
        nom: "Contre-la-montre 50 km",
        subtitle: "",
        imageName: "Contre-la-montre-50",
        category: .outdoor),

    
    // Indoor
    
    // Natation
    EnduranceMove(
        nom: "100m Crawl",
        subtitle: "",
        imageName: "100-Metres-Crawl",
        category: .indoor),
    EnduranceMove(
        nom: "200m Papillon",
        subtitle: "",
        imageName: "200-metres-Papillon",
        category: .indoor),
    EnduranceMove(
        nom: "1500m nage libre",
        subtitle: "",
        imageName: "1500m-nage-libre",
        category: .indoor),
    EnduranceMove(
        nom: "50m Dos",
        subtitle: "",
        imageName: "50-metres-Dos",
        category: .indoor),
    EnduranceMove(
        nom: "100m Dos",
        subtitle: "",
        imageName: "100-metres-Dos",
        category: .indoor),
    EnduranceMove(
        nom: "200m Dos",
        subtitle: "",
        imageName: "200-metres-Dos",
        category: .indoor),
    EnduranceMove(
        nom: "100m Brasse",
        subtitle: "",
        imageName: "100-metres-Brasse",
        category: .indoor),
    EnduranceMove(
        nom: "200m Brasse",
        subtitle: "",
        imageName: "200-metres-Brasse",
        category: .indoor),
    EnduranceMove(
        nom: "400m Nage Libre",
        subtitle: "",
        imageName: "400-metres-Nage-Libre",
        category: .indoor),
    EnduranceMove(
        nom: "800m Nage Libre",
        subtitle: "",
        imageName: "800-metres-Nage-Libre",
        category: .indoor),
    //Ergo
    EnduranceMove(
        nom: "Assault Bike 100m",
        subtitle: "",
        imageName: "assault-bike-100m",
        category: .indoor),
    EnduranceMove(
        nom: "Assault Bike 500m",
        subtitle: "",
        imageName: "assault-bike-500m",
        category: .indoor),
    EnduranceMove(
        nom: "Assault Bike 1000m",
        subtitle: "",
        imageName: "assault-bike-1000m",
        category: .indoor),
    EnduranceMove(
        nom: "Rameur 500m",
        subtitle: "",
        imageName: "rameur-500m",
        category: .indoor),
    EnduranceMove(
        nom: "Rameur 1000m",
        subtitle: "",
        imageName: "rameur-1000m",
        category: .indoor),
    EnduranceMove(
        nom: "Rameur 2000m",
        subtitle: "",
        imageName: "rameur-2000m",
        category: .indoor),
    EnduranceMove(
        nom: "Rameur 5000m",
        subtitle: "",
        imageName: "rameur-5000m",
        category: .indoor),
    EnduranceMove(
        nom: "SkiErg 500m",
        subtitle: "",
        imageName: "skierg-500m",
        category: .indoor),
    EnduranceMove(
        nom: "SkiErg 1000m",
        subtitle: "",
        imageName: "skierg-1000m",
        category: .indoor),
    EnduranceMove(
        nom: "SkiErg 2000m",
        subtitle: "",
        imageName: "skierg-2000m",
        category: .indoor),
    EnduranceMove(
        nom: "BikeErg 500m",
        subtitle: "",
        imageName: "bikeerg-500m",
        category: .indoor),
    EnduranceMove(
        nom: "BikeErg 1000m",
        subtitle: "",
        imageName: "bikeerg-1000m",
        category: .indoor),
    EnduranceMove(
        nom: "BikeErg 2000m",
        subtitle: "",
        imageName: "bikeerg-2000m",
        category: .indoor),
    EnduranceMove(
        nom: "BikeErg 5000m",
        subtitle: "",
        imageName: "bikeerg-5000m",
        category: .indoor),
    ]

