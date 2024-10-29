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
    // Calistenie
    GymMove(
        nom: "Pull-Up-Strict",
        subtitle: NSLocalizedString("PullUpStrict", comment: ""),
        imageName: "Pull-Up",
        category: .calisthenics),
    GymMove(
        nom: "Push-Up",
        subtitle: NSLocalizedString("PushUp", comment: ""),
        imageName: "Push-Up",
        category: .calisthenics),
    GymMove(
        nom: "Push-Up-Diamond",
        subtitle: NSLocalizedString("PushUpDiamond", comment: ""),
        imageName: "Push-Up-Diamond",
        category: .calisthenics),
    GymMove(
        nom: "One-Arm Push-Up",
        subtitle: NSLocalizedString("OneArmPushUp", comment: ""),
        imageName: "One-Arm-Push-Up",
        category: .calisthenics),
    GymMove(
        nom: "Pull-Up-Kipping",
        subtitle: NSLocalizedString("PullUpKipping", comment: ""),
        imageName: "Pull-Up-Kipping",
        category: .calisthenics),
    GymMove(
        nom: "Pull-Up-Butterfly",
        subtitle: NSLocalizedString("PullUpButterfly", comment: ""),
        imageName: "Pull-Up-butterfly",
        category: .calisthenics),
    GymMove(
        nom: "Chin-Up",
        subtitle: NSLocalizedString("ChinUp", comment: ""),
        imageName: "Chin-Up",
        category: .calisthenics),
    GymMove(
        nom: "Dips",
        subtitle: NSLocalizedString("Dips", comment: ""),
        imageName: "Dips",
        category: .calisthenics),
    GymMove(
        nom: "Lunge",
        subtitle: NSLocalizedString("Lunge", comment: ""),
        imageName: "Lunge",
        category: .calisthenics),
    GymMove(
        nom: "Strict-Bar-Muscle-Up",
        subtitle: NSLocalizedString("StrictBarMuscleUp", comment: ""),
        imageName: "Strict-Bar-Muscle-Up",
        category: .calisthenics),
    GymMove(
        nom: "Kipping-Bar-Muscle-Up",
        subtitle: NSLocalizedString("KippingBarMuscleUp", comment: ""),
        imageName: "Kipping-Bar-Muscle-Up",
        category: .calisthenics),
    GymMove(
        nom: "Pistol-Squat-Right",
        subtitle: NSLocalizedString("PistolSquat", comment: ""),
        imageName: "Pistol-Squat-Right",
        category: .calisthenics),
    GymMove(
        nom: "Pistol-Squat-Left",
        subtitle: NSLocalizedString("PistolSquat", comment: ""),
        imageName: "Pistol-Squat-Left",
        category: .calisthenics),
    GymMove(
        nom: "Chess-To-Bar",
        subtitle: NSLocalizedString("ChestToBar", comment: ""),
        imageName: "Chess-To-Bar",
        category: .calisthenics),
    GymMove(
        nom: "Clapping-Push-Up",
        subtitle: NSLocalizedString("ClappingPushUp", comment: ""),
        imageName: "Clapping-Push-Up",
        category: .calisthenics),
    GymMove(
        nom: "Burpee",
        subtitle: NSLocalizedString("Burpee", comment: ""),
        imageName: "Burpee",
        category: .calisthenics),
    GymMove(
        nom: "Jumping-Jack",
        subtitle: NSLocalizedString("Jumping Jack", comment: ""),
        imageName: "Jumping-Jack",
        category: .calisthenics),
    GymMove(
        nom: "Air-Squat",
        subtitle: NSLocalizedString("AirSquat", comment: ""),
        imageName: "Air-Squat",
        category: .calisthenics),
    GymMove(
        nom: "Air-Squat-Jump",
        subtitle: NSLocalizedString("AirSquatJump", comment: ""),
        imageName: "Air-Squat-Jump",
        category: .calisthenics),
    GymMove(
        nom: "Mountain-Climber",
        subtitle: NSLocalizedString("MountainClimber", comment: ""),
        imageName: "Mountain-Climber",
        category: .calisthenics),
    GymMove(
        nom: "Toes-To-Bar",
        subtitle: NSLocalizedString("ToesToBar", comment: ""),
        imageName: "Toes-To-Bar",
        category: .calisthenics),
   
    
    // Gymnastique
    GymMove(
        nom: "Handstand-Push-Up",
        subtitle: NSLocalizedString("HandstandPushUp", comment: ""),
        imageName: "Handstand-Push-Up",
        category: .gymnastique),
    GymMove(
        nom: "Ring-Dips",
        subtitle: NSLocalizedString("RingDips", comment: ""),
        imageName: "Ring-Dips",
        category: .gymnastique),
    GymMove(
        nom: "Kipping-Ring-Muscle-Up",
        subtitle: NSLocalizedString("KippingRingMuscleUp", comment: ""),
        imageName: "Kipping-Ring-Muscle-Up",
        category: .gymnastique),
    GymMove(
        nom: "Strict-Ring-Muscle-Up",
        subtitle: NSLocalizedString("StrictRingMuscleUp", comment: ""),
        imageName: "Strict-Ring-Muscle-Up",
        category: .gymnastique),
    GymMove(
        nom: "Ring-Pull-Up",
        subtitle: NSLocalizedString("RingPullUp", comment: ""),
        imageName: "Ring-Pull-Up",
        category: .gymnastique),
    GymMove(
        nom: "Ring-Toes-To-Bar",
        subtitle: NSLocalizedString("RingToesToBar", comment: ""),
        imageName: "Ring-Toes-To-Bar",
        category: .gymnastique),
    GymMove(
        nom: "Simple-Under",
        subtitle: NSLocalizedString("SimpleUnder", comment: ""),
        imageName: "Simple-Under",
        category: .gymnastique),
    GymMove(
        nom: "Double-Under",
        subtitle: NSLocalizedString("DoubleUnder", comment: ""),
        imageName: "Double-Under",
        category: .gymnastique),
    GymMove(
        nom: "Handstand-Walk",
        subtitle: NSLocalizedString("HandstandWalk", comment: ""),
        imageName: "Handstand-Walk",
        category: .gymnastique),
    GymMove(
        nom: "Robe-Climb",
        subtitle: NSLocalizedString("RobeClimb", comment: ""),
        imageName: "Robe-Climb",
        category: .gymnastique),
    GymMove(
        nom: "Iron-Cross",
        subtitle: NSLocalizedString("IronCross", comment: ""),
        imageName: "Iron-Cross",
        category: .gymnastique),
    GymMove(
        nom: "Wall-Walk",
        subtitle: NSLocalizedString("WallWalk", comment: ""),
        imageName: "Wall-Walk",
        category: .gymnastique),
]
