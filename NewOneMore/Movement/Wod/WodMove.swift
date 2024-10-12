//
//  WodMove.swift
//  NewOneMore
//
//  Created by dimitri on 28/09/2024.
//


import Foundation

struct WodMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: WodCategories
}

let wodMoves = [
    // WOD Girls
    WodMove(nom:
                "Annie",
            subtitle: NSLocalizedString("annie", comment: ""),
            imageName: "Annie",
            category: .girl),
    WodMove(nom:
                "Fran",
            subtitle: NSLocalizedString("Fran", comment: ""),
            imageName: "Fran",
            category:
            .girl),
    WodMove(nom: "Diane",
            subtitle: NSLocalizedString("Diane", comment: ""),
            imageName: "Diane",
            category:
            .girl),
    WodMove(nom: "Helen",
            subtitle: NSLocalizedString("Helen", comment: ""),
            imageName: "Helen",
            category: .girl),
    WodMove(nom: "Grace",
            subtitle: NSLocalizedString("Grace", comment: ""),
            imageName: "Grace",
            category: .girl),
    WodMove(nom: "Jackie",
            subtitle: NSLocalizedString("Jackie", comment: ""),
            imageName: "Jackie",
            category: .girl),
    WodMove(nom: "Angie",
            subtitle: NSLocalizedString("Angie", comment: ""),
            imageName: "Angie",
            category: .girl),
    WodMove(nom: "Karen",
            subtitle: NSLocalizedString("Karen", comment: ""),
            imageName: "Karen",
            category: .girl),
    WodMove(nom: "Barbara",
            subtitle: NSLocalizedString("Barbara", comment: ""),
            imageName: "Barbara",
            category: .girl),
    WodMove(nom: "Elizabeth",
            subtitle: NSLocalizedString("Elizabeth", comment: ""),
            imageName: "Elizabeth",
            category: .girl),
    WodMove(nom: "Isabel",
            subtitle: NSLocalizedString("Isabel", comment: ""),
            imageName: "Isabel",
            category: .girl),
    WodMove(nom: "Nancy",
            subtitle: NSLocalizedString("Nancy", comment: ""),
            imageName: "Nancy",
            category: .girl),
    
    // WOD Heroes
    WodMove(
        nom: "DT",
        subtitle: NSLocalizedString("DT", comment: ""),
        imageName: "DT",
        category: .hero
    ),
    WodMove(
        nom: "Murph",
        subtitle: NSLocalizedString("Murph", comment: ""),
        imageName: "Murph",
        category: .hero
    ),
    WodMove(
        nom: "Wilmot",
        subtitle: NSLocalizedString("Wilmot", comment: ""),
        imageName: "Wilmot",
        category: .hero
    ),
    WodMove(
        nom: "Jerry",
        subtitle: NSLocalizedString("Jerry", comment: ""),
        imageName: "Jerry",
        category: .hero
    ),
    WodMove(
        nom: "Badger",
        subtitle: NSLocalizedString("Badger", comment: ""),
        imageName: "Badger",
        category: .hero
    ),
    WodMove(
        nom: "Glen",
        subtitle: NSLocalizedString("Glen", comment: ""),
        imageName: "Glen",
        category: .hero
    ),
    WodMove(
        nom: "Michael",
        subtitle: NSLocalizedString("Michael", comment: ""),
        imageName: "Michael",
        category: .hero
    ),
    WodMove(
        nom: "Kalsu",
        subtitle: NSLocalizedString("Kalsu", comment: ""),
        imageName: "Kalsu",
        category: .hero
    ),
    WodMove(
        nom: "Josh",
        subtitle: NSLocalizedString("Josh", comment: ""),
        imageName: "Josh",
        category: .hero
    ),
    WodMove(
        nom: "Blake",
        subtitle: NSLocalizedString("Blake", comment: ""),
        imageName: "Blake",
        category: .hero
    ),
    
    // Open
    WodMove(nom: "11.1 ",
            subtitle: "150 Wall Balls",
            imageName: "11.1",
            category: .open),
]
