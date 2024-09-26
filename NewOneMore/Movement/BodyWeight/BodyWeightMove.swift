//
//  BodyWeightMove.swift
//  NewOneMore
//
//  Created by dimitri on 25/09/2024.
//

import Foundation

struct BodyWeightMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: BodyWeightCategories
}

// Mouvements de Street Workout et Gymnastique
let bodyWeightMoves = [
    // Calistenie
    BodyWeightMove(nom: "Pull-Up-Strict", subtitle: "...", imageName: "Pull-Up-Strict", category: .calisthenics),
    BodyWeightMove(nom: "Push-Up", subtitle: "...", imageName: "Push-Up", category: .calisthenics),
    BodyWeightMove(nom: "Push-Up-Diamond", subtitle: "...", imageName: "Push-Up-Diamond", category: .calisthenics),
    BodyWeightMove(nom: "Pull-Up-Kipping", subtitle: "...", imageName: "Pull-Up-Kipping", category: .calisthenics),
    BodyWeightMove(nom: "Pull-Up-Butterfly", subtitle: "...", imageName: "Pull-Up-Butterfly", category: .calisthenics),
    BodyWeightMove(nom: "Chin-Up", subtitle: "...", imageName: "Chin-Up", category: .calisthenics),
    BodyWeightMove(nom: "Dips", subtitle: "...", imageName: "Dips", category: .calisthenics),
    BodyWeightMove(nom: "Lunge", subtitle: "...", imageName: "Lunge", category: .calisthenics),
    BodyWeightMove(nom: "Strict-Bar-Muscle-Up", subtitle: "...", imageName: "Strict-Bar-Muscle-Up", category: .calisthenics),
    BodyWeightMove(nom: "Pistol-Squat-Right", subtitle: "...", imageName: "Pistol-Squat-Right", category: .calisthenics),
    BodyWeightMove(nom: "Pistol-Squat-Left", subtitle: "...", imageName: "Pistol-Squat-Left", category: .calisthenics),
    BodyWeightMove(nom: "Handstand-Push-Up", subtitle: "...", imageName: "Handstand-Push-Up", category: .calisthenics),
    BodyWeightMove(nom: "Chess-To-Bar", subtitle: "...", imageName: "Chess-To-Bar", category: .calisthenics),
    BodyWeightMove(nom: "Clapping-Push-Up", subtitle: "...", imageName: "Clapping-Push-Up", category: .calisthenics),
    BodyWeightMove(nom: "Toes-To-Bar", subtitle: "...", imageName: "Toes-To-Bar", category: .calisthenics),
   
    
    // Gymnastique
    BodyWeightMove(nom: "Ring-Dips", subtitle: "...", imageName: "Ring-Dips", category: .gymnastique),
    BodyWeightMove(nom: "Keeping-Ring-Muscle-Up", subtitle: "...", imageName: "Keeping-Ring-Muscle-Up", category: .gymnastique),
   
]
