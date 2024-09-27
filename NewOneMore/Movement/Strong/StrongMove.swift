//
//  StrongMouv.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import Foundation


struct StrongMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: Categories
}

let stringMoovs = [    
    // Haltérophilie
    StrongMove(nom: "Clean and Jerk", subtitle: "...", imageName: "Clean-And-Jerk", category: .halterophilie),
    StrongMove(nom: "Clean", subtitle: "...", imageName: "Clean", category: .halterophilie),
    StrongMove(nom: "Front Squat", subtitle: "...", imageName: "Front-Squat", category: .halterophilie),
    StrongMove(nom: "Hang Power Clean", subtitle: "...", imageName: "Hang-Power-Clean", category: .halterophilie),
    StrongMove(nom: "Hang Power Snatch", subtitle: "...", imageName: "Hang-Power-Snatch", category: .halterophilie),
    StrongMove(nom: "Hang Snatch", subtitle: "...", imageName: "Hang-Snatch", category: .halterophilie),
    StrongMove(nom: "Jerk", subtitle: "...", imageName: "Jerk", category: .halterophilie),
    StrongMove(nom: "Muscle Clean", subtitle: "...", imageName: "Muscle-Clean", category: .halterophilie),
    StrongMove(nom: "Muscle Snatch", subtitle: "...", imageName: "Muscle-Snatch", category: .halterophilie),
    StrongMove(nom: "Overhead Squat", subtitle: "...", imageName: "Overhead-Squat", category: .halterophilie),
    StrongMove(nom: "Power Clean", subtitle: "...", imageName: "Power-Clean", category: .halterophilie),
    StrongMove(nom: "Power Snatch", subtitle: "...", imageName: "Power-Snatch", category: .halterophilie),
    StrongMove(nom: "Push Press", subtitle: "...", imageName: "Push-Press", category: .halterophilie),
    StrongMove(nom: "Snatch", subtitle: "...", imageName: "Snatch", category: .halterophilie),
    StrongMove(nom: "Split Jerk", subtitle: "...", imageName: "Split-Jerk", category: .halterophilie),
    StrongMove(nom: "Squat Clean", subtitle: "..t.", imageName: "Squat-Clean", category: .halterophilie),
    StrongMove(nom: "Thruster", subtitle: "...", imageName: "Thruster", category: .halterophilie),
    StrongMove(nom: "Back Squat", subtitle: "...", imageName: "Back-Squat", category: .halterophilie),
    StrongMove(nom: "Deadlift", subtitle: "...", imageName: "deadlift", category: .halterophilie),
    
    // Musculation
    StrongMove(nom: "Barbell Curl", subtitle: "...", imageName: "Barbell-Curl", category: .musculation),
    StrongMove(nom: "Decline Bench Press", subtitle: "...", imageName: "Decline-Bench-Press", category: .musculation),
    StrongMove(nom: "Dumbbell Curl", subtitle: "...", imageName: "Dumbell-Curl", category: .musculation),
    StrongMove(nom: "Shoulder Press", subtitle: "...", imageName: "Shoulder-Press", category: .musculation),
    StrongMove(nom: "Front Raise", subtitle: "...", imageName: "Front-Raise", category: .musculation),
    StrongMove(nom: "Bench Press", subtitle: "...", imageName: "Bench-Press", category: .musculation),
    StrongMove(nom: "Hammer Curl", subtitle: "...", imageName: "Hammer-Curl", category: .musculation),
    StrongMove(nom: "Incline Bench Press", subtitle: "...", imageName: "Incline-Bench-Press", category: .musculation),
    StrongMove(nom: "Lateral Raise", subtitle: "...", imageName: "Lateral-Raise", category: .musculation),
    StrongMove(nom: "Leg Press", subtitle: "...", imageName: "Leg-Press", category: .musculation),
    StrongMove(nom: "Military Press", subtitle: "...", imageName: "Military-Press", category: .musculation),
    StrongMove(nom: "Rowing Bar", subtitle: "...", imageName: "Rowing-Bar", category: .musculation),
    StrongMove(nom: "Skull Crusher", subtitle: "...", imageName: "Skull-Crusher", category: .musculation),
    StrongMove(nom: "Weighted Pull-Up", subtitle: "...", imageName: "Weighted Pull-Up", category: .musculation),
    StrongMove(nom: "Weighted-Dips", subtitle: "...", imageName: "Weighted-Dips", category: .musculation)
]
