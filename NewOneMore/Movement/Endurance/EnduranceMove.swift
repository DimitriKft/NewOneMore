//
//  EnduranceMove.swift
//  NewOneMore
//
//  Created by dimitri on 30/09/2024.
//

import Foundation


import Foundation

struct EnduranceMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: EnduranceCategories
}


var enduranceMoves: [EnduranceMove] = [
    // Run
    EnduranceMove(nom: "Marathon", subtitle: "...", imageName: "Marathon", category: .run),
    // Swim
    EnduranceMove(nom: "100-mètres-Crawl", subtitle: "...", imageName: "100-metres-Crawl", category: .swim)
]
