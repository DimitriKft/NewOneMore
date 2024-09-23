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
    // Powerlifting
    StrongMove(nom: "Back Squat", subtitle: "Squat arrière", imageName: "Back-Squat", category: .halterophilie),
    StrongMove(nom: "Bench Press", subtitle: "Développé couché", imageName: "Bench-Press", category: .musculation),
    StrongMove(nom: "Deadlift", subtitle: "Soulevé de terre", imageName: "deadlift", category: .halterophilie),
    
    // Haltérophilie
    StrongMove(nom: "Clean and Jerk", subtitle: "Épaulé-jeté", imageName: "Clean-And-Jerk", category: .halterophilie),
    StrongMove(nom: "Clean", subtitle: "Épaulé", imageName: "Clean", category: .halterophilie),
    StrongMove(nom: "Front Squat", subtitle: "Squat avant", imageName: "Front-Squat", category: .halterophilie),
    StrongMove(nom: "Hang Power Clean", subtitle: "Épaulé de puissance suspendu", imageName: "Hang-Power-Clean", category: .halterophilie),
    StrongMove(nom: "Hang Power Snatch", subtitle: "Arraché de puissance suspendu", imageName: "Hang-Power-Snatch", category: .halterophilie),
    StrongMove(nom: "Hang Snatch", subtitle: "Arraché suspendu", imageName: "Hang-Snatch", category: .halterophilie),
    StrongMove(nom: "Jerk", subtitle: "Jeté", imageName: "Jerk", category: .halterophilie),
    StrongMove(nom: "Muscle Clean", subtitle: "Épaulé sans squat", imageName: "Muscle-Clean", category: .halterophilie),
    StrongMove(nom: "Muscle Snatch", subtitle: "Arraché sans squat", imageName: "Muscle-Snatch", category: .halterophilie),
    StrongMove(nom: "Overhead Squat", subtitle: "Squat au-dessus de la tête", imageName: "Overhead-Squat", category: .halterophilie),
    StrongMove(nom: "Power Clean", subtitle: "Épaulé de puissance", imageName: "Power-Clean", category: .halterophilie),
    StrongMove(nom: "Power Snatch", subtitle: "Arraché de puissance", imageName: "Power-Snatch", category: .halterophilie),
    StrongMove(nom: "Push Press", subtitle: "Développé poussé", imageName: "Push-Press", category: .halterophilie),
    StrongMove(nom: "Snatch", subtitle: "Arraché", imageName: "Snatch", category: .halterophilie),
    StrongMove(nom: "Split Jerk", subtitle: "Jeté fendu", imageName: "Split-Jerk", category: .halterophilie),
    StrongMove(nom: "Squat Clean", subtitle: "Épaulé avec squat", imageName: "Squat-Clean", category: .halterophilie),
    StrongMove(nom: "Thruster", subtitle: "Squat avant avec poussée", imageName: "Thruster", category: .halterophilie),
    
    // Musculation
    StrongMove(nom: "Barbell Curl", subtitle: "Curl à la barre", imageName: "Barbell-Curl", category: .musculation),
    StrongMove(nom: "Decline Bench Press", subtitle: "Développé couché décliné", imageName: "Decline-Bench-Press", category: .musculation),
    StrongMove(nom: "Dumbbell Curl", subtitle: "Curl avec haltères", imageName: "Dumbell-Curl", category: .musculation),
    StrongMove(nom: "Shoulder Press", subtitle: "Développé épaules avec haltères", imageName: "Shoulder-Press", category: .musculation),
    StrongMove(nom: "Front Raise", subtitle: "Élévation frontale", imageName: "Front-Raise", category: .musculation),
    StrongMove(nom: "Hammer Curl", subtitle: "Curl marteau", imageName: "Hammer-Curl", category: .musculation),
    StrongMove(nom: "Incline Bench Press", subtitle: "Développé couché incliné", imageName: "Incline-Bench-Press", category: .musculation),
    StrongMove(nom: "Lateral Raise", subtitle: "Élévation latérale", imageName: "Lateral-Raise", category: .musculation),
    StrongMove(nom: "Leg Press", subtitle: "Presse à jambes", imageName: "Leg-Press", category: .musculation),
    StrongMove(nom: "Military Press", subtitle: "Développé militaire", imageName: "Military-Press", category: .musculation),
    StrongMove(nom: "Pull-Up", subtitle: "Tractions", imageName: "Pull-Up", category: .musculation),
    StrongMove(nom: "Rowing Bar", subtitle: "Tirage à la barre", imageName: "Rowing-Bar", category: .musculation),
    StrongMove(nom: "Skull Crusher", subtitle: "Extension triceps à la barre", imageName: "Skull-Crusher", category: .musculation),
    StrongMove(nom: "Tricep Dips", subtitle: "Dips pour triceps", imageName: "Tricep-Dips", category: .musculation)
]
