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
    WodMove(nom: "Fran", subtitle: "Thrusters et Pull-ups", imageName: "Fran", category: .girl),
    WodMove(nom: "Diane", subtitle: "Deadlifts et Handstand Push-ups", imageName: "Diane", category: .girl),
    WodMove(nom: "Helen", subtitle: "400m Run, Kettlebell Swings, Pull-ups", imageName: "Helen", category: .girl),
    WodMove(nom: "Grace", subtitle: "30 Clean and Jerks", imageName: "Grace", category: .girl),
    WodMove(nom: "Jackie", subtitle: "1000m Row, Thrusters, Pull-ups", imageName: "Jackie", category: .girl),
    WodMove(nom: "Angie", subtitle: "Pull-ups, Push-ups, Sit-ups, Air Squats", imageName: "Angie", category: .girl),
    WodMove(nom: "Karen", subtitle: "150 Wall Balls", imageName: "Karen", category: .girl),
    
    // WOD Heroes
    WodMove(nom: "Murph", subtitle: "1 Mile Run, 100 Pull-ups, 200 Push-ups, 300 Air Squats, 1 Mile Run", imageName: "Murph", category: .hero),
    WodMove(nom: "DT", subtitle: "12 Deadlifts, 9 Hang Power Cleans, 6 Push Jerks", imageName: "DT", category: .hero),
    WodMove(nom: "Wilmot", subtitle: "6 Rounds: 50 Air Squats, 25 Ring Dips", imageName: "Wilmot", category: .hero),
    WodMove(nom: "Jerry", subtitle: "1 Mile Run, 2000m Row, 1 Mile Run", imageName: "Jerry", category: .hero),
    WodMove(nom: "Badger", subtitle: "30 Squat Cleans, 30 Pull-ups, 800m Run", imageName: "Badger", category: .hero),
    WodMove(nom: "Glen", subtitle: "30 Clean and Jerks, 1 Mile Run, Rope Climbs", imageName: "Glen", category: .hero),
    WodMove(nom: "Nate", subtitle: "2 Muscle-ups, 4 Handstand Push-ups, 8 Kettlebell Swings", imageName: "Nate", category: .hero),
]
