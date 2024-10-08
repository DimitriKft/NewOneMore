//
//  GymMove.swift
//  NewOneMore
//
//  Created by dimitri on 08/10/2024.
//

import Foundation

struct GymMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: GymCategories
}

var gymMoves: [GymMove] = [
    GymMove(nom: "Pull-Up-Strict", subtitle: "...", imageName: "Pull-Up-Strict", category: .calisthenics),
    GymMove(nom: "Robe-Climb", subtitle: "...", imageName: "Robe-Climb", category: .gymnastique),
]
