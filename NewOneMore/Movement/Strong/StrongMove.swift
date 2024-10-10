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
    StrongMove(
        nom: "Push Press",
        subtitle: NSLocalizedString("PushPress", comment: ""),
        imageName: "Push-Press",
        category: .halterophilie),
    StrongMove(
        nom: "Snatch",
        subtitle: NSLocalizedString("Snatch", comment: ""),
        imageName: "Snatch",
        category: .halterophilie),
    StrongMove(
        nom: "Split Jerk",
        subtitle: NSLocalizedString("SplitJerk", comment: ""),
        imageName: "Split-Jerk",
        category: .halterophilie),
    StrongMove(
        nom: "Squat Clean",
        subtitle: NSLocalizedString("SquatClean", comment: ""),
        imageName: "Squat-Clean",
        category: .halterophilie),
    StrongMove(
        nom: "Thruster",
        subtitle: NSLocalizedString("Thruster", comment: ""),
        imageName: "Thruster",
        category: .halterophilie),
    StrongMove(
        nom: "Back Squat",
        subtitle: NSLocalizedString("BackSquat", comment: ""),
        imageName: "Back-Squat",
        category: .halterophilie),
    StrongMove(
        nom: "Deadlift",
        subtitle: NSLocalizedString("Deadlift", comment: ""),
        imageName: "deadlift",
        category: .halterophilie),
    StrongMove(
        nom: "Push Jerk",
        subtitle: NSLocalizedString("PushJerk", comment: ""),
        imageName: "Push-Jerk",
        category: .halterophilie),
    StrongMove(
        nom: "Sumo Deadlift",
        subtitle: NSLocalizedString("SumoDeadlift", comment: ""),
        imageName: "Sumo-Deadlift",
        category: .halterophilie),
    
    
    // Musculation
    StrongMove(nom:
                "Barbell Curl",
               subtitle: NSLocalizedString("BarbellCurl", comment: ""),
               imageName: "Barbell-Curl",
               category: .musculation),
    StrongMove(
        nom: "Decline Bench Press",
        subtitle: NSLocalizedString("DeclineBenchPress", comment: ""),
        imageName: "Decline-Bench-Press",
        category: .musculation),
    StrongMove(
        nom: "Dumbbell Curl",
        subtitle: NSLocalizedString("DumbellCurl", comment: ""),
        imageName: "Dumbell-Curl",
        category: .musculation),
    StrongMove(
        nom: "Shoulder Press",
        subtitle: NSLocalizedString("ShoulderPress", comment: ""),
        imageName: "Shoulder-Press",
        category: .musculation),
    StrongMove(
        nom: "Front Raise",
        subtitle: NSLocalizedString("FrontRaise", comment: ""),
        imageName: "Front-Raise",
        category: .musculation),
    StrongMove(
        nom: "Bench Press",
        subtitle: NSLocalizedString("BenchPress", comment: ""),
        imageName: "Bench-Press",
        category: .musculation),
    StrongMove(
        nom: "Hammer Curl",
        subtitle: NSLocalizedString("HammerCurl", comment: ""),
        imageName: "Hammer-Curl",
        category: .musculation),
    StrongMove(
        nom: "Incline Bench Press",
        subtitle: NSLocalizedString("InclineBenchPress", comment: ""),
        imageName: "Incline-Bench-Press",
        category: .musculation),
    StrongMove(
        nom: "Lateral Raise",
        subtitle: NSLocalizedString("LateralRaise", comment: ""),
        imageName: "Lateral-Raise",
        category: .musculation),
    StrongMove(
        nom: "Leg Press",
        subtitle: NSLocalizedString("LegPress", comment: ""),
        imageName: "Leg-Press",
        category: .musculation),
    StrongMove(
        nom: "Military Press",
        subtitle: NSLocalizedString("MilitaryPress", comment: ""),
        imageName: "Military-Press",
        category: .musculation),
    StrongMove(
        nom: "Rowing Bar",
        subtitle: NSLocalizedString("RowingBar", comment: ""),
        imageName: "Rowing-Bar",
        category: .musculation),
    StrongMove(
        nom: "Skull Crusher",
        subtitle: NSLocalizedString("SkullCrusher", comment: ""),
        imageName: "Skull-Crusher",
        category: .musculation),
    StrongMove(
        nom: "Weighted Pull-Up",
        subtitle: NSLocalizedString("WeightedPullUp", comment: ""),
        imageName: "Weighted Pull-Up",
        category: .musculation),
    StrongMove(
        nom: "Weighted-Dips",
        subtitle: NSLocalizedString("WeightedDips", comment: ""),
        imageName: "Weighted-Dips",
        category: .musculation),
    StrongMove(
        nom: "Cable Triceps Pushdown",
        subtitle: NSLocalizedString("CableTricepsPushdown", comment: ""),
        imageName: "Cable-Triceps-Pushdown",
        category: .musculation),
    StrongMove(
        nom: "Leg Curl",
        subtitle: NSLocalizedString("LegCurl", comment: ""),
        imageName: "Leg-Curl",
        category: .musculation),
    StrongMove(
        nom: "Leg Extension",
        subtitle: NSLocalizedString("LegExtension", comment: ""),
        imageName: "Leg-Extension",
        category: .musculation),
    StrongMove(
        nom: "Calf Raise",
        subtitle: NSLocalizedString("CalfRaise", comment: ""),
        imageName: "Calf-Raise",
        category: .musculation),
    StrongMove(
        nom: "Dumbbell Fly",
        subtitle: NSLocalizedString("DumbellFly", comment: ""),
        imageName: "Dumbbell-Fly",
        category: .musculation),
    StrongMove(
        nom: "Seated Row",
        subtitle: NSLocalizedString("SeatedRow", comment: ""),
        imageName: "Seated-Row",
        category: .musculation),
    StrongMove(nom: "Lat Pulldown", subtitle: ".", imageName: "Lat-Pulldown", category: .musculation),
    StrongMove(nom: "Cable Crunch", subtitle: ".", imageName: "Cable-Crunch", category: .musculation),
    StrongMove(nom: "Dumbbell Bench Press", subtitle: "...", imageName: "Dumbbell-Bench-Press", category: .musculation),
    StrongMove(nom: "T-Bar Row", subtitle: ".", imageName: "T-Bar-Row", category: .musculation),
    StrongMove(nom: "Strict Press", subtitle: "...", imageName: "strict-press", category: .musculation),
    
]
