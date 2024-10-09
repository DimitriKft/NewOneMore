//
//  StrongMouv.swift
//  NewOneMore
//
//  Created by dimitri on 19/09/2024.
//

import SwiftUI


struct StrongMove: Hashable {
    let nom: String
    let subtitle: String
    let imageName: String
    let category: Categories
}

let stringMoovs = [
    // Haltérophilie
    StrongMove(
        nom: "Clean and Jerk",
        subtitle:  NSLocalizedString("CleanAndJerk", comment: ""),
        imageName: "Clean-And-Jerk",
        category: .halterophilie
    ),
    StrongMove(
        nom: "Clean",
        subtitle: NSLocalizedString("Clean", comment: ""),
        imageName: "Clean",
        category: .halterophilie),
    StrongMove(
        nom: "Front Squat",
        subtitle: NSLocalizedString("FrontSquat", comment: ""),
        imageName: "Front-Squat",
        category: .halterophilie),
    StrongMove(
        nom: "Hang Power Clean",
        subtitle: NSLocalizedString("HangPowerClean", comment: ""),
        imageName: "Hang-Power-Clean",
        category: .halterophilie),
    StrongMove(
        nom: "Hang Power Snatch",
        subtitle: NSLocalizedString("HangPowerSnatch", comment: ""),
        imageName: "Hang-Power-Snatch",
        category: .halterophilie),
    StrongMove(
        nom: "Hang Snatch",
        subtitle: NSLocalizedString("HangSnatch", comment: ""),
        imageName: "Hang-Snatch",
        category: .halterophilie),
    StrongMove(
        nom: "Jerk",
        subtitle: NSLocalizedString("Jerk", comment: ""),
        imageName: "Jerk",
        category: .halterophilie),
    StrongMove(
        nom: "Muscle Clean",
        subtitle: NSLocalizedString("MuscleClean", comment: ""),
        imageName: "Muscle-Clean",
        category: .halterophilie),
    StrongMove(
        nom: "Muscle Snatch",
        subtitle: NSLocalizedString("MuscleSnatch", comment: ""),
        imageName: "Muscle-Snatch",
        category: .halterophilie),
    StrongMove(
        nom: "Overhead Squat",
        subtitle: NSLocalizedString("OverHeadSquat", comment: ""),
        imageName: "Overhead-Squat",
        category: .halterophilie),
    StrongMove(
        nom: "Power Clean",
        subtitle: NSLocalizedString("PowerClean", comment: ""),
        imageName: "Power-Clean",
        category: .halterophilie),
    StrongMove(
        nom: "Power Snatch",
        subtitle: NSLocalizedString("PowerSnatch", comment: ""),
        imageName: "Power-Snatch",
        category: .halterophilie),
    StrongMove(nom: "Push Press", subtitle: "...", imageName: "Push-Press", category: .halterophilie),
    StrongMove(nom: "Snatch", subtitle: "...", imageName: "Snatch", category: .halterophilie),
    StrongMove(nom: "Split Jerk", subtitle: "...", imageName: "Split-Jerk", category: .halterophilie),
    StrongMove(nom: "Squat Clean", subtitle: "..t.", imageName: "Squat-Clean", category: .halterophilie),
    StrongMove(nom: "Thruster", subtitle: "...", imageName: "Thruster", category: .halterophilie),
    StrongMove(nom: "Back Squat", subtitle: "...", imageName: "Back-Squat", category: .halterophilie),
    StrongMove(nom: "Deadlift", subtitle: "...", imageName: "deadlift", category: .halterophilie),
    // Haltérophilie
    StrongMove(nom: "Push Jerk", subtitle: "Variante du Jerk où l'athlète utilise une légère flexion des jambes pour rattraper la barre au-dessus de la tête.", imageName: "Push-Jerk", category: .halterophilie),
    StrongMove(nom: "Sumo Deadlift", subtitle: "Un deadlift avec une position large des jambes, engageant davantage les hanches et les adducteurs.", imageName: "Sumo-Deadlift", category: .halterophilie),
    
    
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
    StrongMove(nom: "Weighted-Dips", subtitle: "...", imageName: "Weighted-Dips", category: .musculation),
    StrongMove(nom: "Cable Triceps Pushdown", subtitle: "Exercice d'isolation pour les triceps, exécuté à la machine à câble.", imageName: "Cable-Triceps-Pushdown", category: .musculation),
    StrongMove(nom: "Leg Curl", subtitle: "Exercice pour les ischio-jambiers, réalisé à la machine en position couchée ou assise.", imageName: "Leg-Curl", category: .musculation),
    StrongMove(nom: "Leg Extension", subtitle: "Exercice d'isolation pour les quadriceps, réalisé à la machine.", imageName: "Leg-Extension", category: .musculation),
    StrongMove(nom: "Calf Raise", subtitle: "Exercice pour développer les mollets, réalisé à la machine ou avec des haltères.", imageName: "Calf-Raise", category: .musculation),
    StrongMove(nom: "Dumbbell Fly", subtitle: "Exercice pour étirer et contracter la poitrine, réalisé avec des haltères en position allongée.", imageName: "Dumbbell-Fly", category: .musculation),
    StrongMove(nom: "Seated Row", subtitle: "Exercice de tirage pour développer la largeur du dos, réalisé à la machine en position assise.", imageName: "Seated-Row", category: .musculation),
    StrongMove(nom: "Lat Pulldown", subtitle: "Exercice de tirage vertical pour développer les dorsaux et la largeur du dos.", imageName: "Lat-Pulldown", category: .musculation),
    StrongMove(nom: "Cable Crunch", subtitle: "Exercice pour les abdominaux réalisé à la machine à câble.", imageName: "Cable-Crunch", category: .musculation),
    StrongMove(nom: "Dumbbell Bench Press", subtitle: "Variante du Bench Press réalisée avec des haltères pour un mouvement plus libre et une activation accrue des muscles stabilisateurs.", imageName: "Dumbbell-Bench-Press", category: .musculation),
    StrongMove(nom: "T-Bar Row", subtitle: "Exercice de tirage pour développer l'épaisseur du dos, particulièrement le milieu du dos et les rhomboïdes.", imageName: "T-Bar-Row", category: .musculation)
    
]
