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
    WodMove(nom: "Annie", subtitle: "Le WOD Annie est un benchmark CrossFit combinant 50, 40, 30, 20, et 10 répétitions de double unders et de sit-ups.    Annie Sakamoto est l’une des athlètes pionnières du CrossFit et fait partie des premières adeptes du mouvement. Elle est surtout connue pour avoir contribué au développement du CrossFit aux côtés de son fondateur, Greg Glassman. Annie a également été coach et compétitrice aux CrossFit Games, gagnant une reconnaissance pour sa passion et son expertise.", imageName: "Annie", category: .girl),
    WodMove(nom: "Fran", subtitle: "Thrusters et Pull-ups", imageName: "Fran", category: .girl),
    WodMove(nom: "Diane", subtitle: "Deadlifts et Handstand Push-ups", imageName: "Diane", category: .girl),
    WodMove(nom: "Helen", subtitle: "400m Run, Kettlebell Swings, Pull-ups", imageName: "Helen", category: .girl),
    WodMove(nom: "Grace", subtitle: "30 Clean and Jerks", imageName: "Grace", category: .girl),
    WodMove(nom: "Jackie", subtitle: "1000m Row, Thrusters, Pull-ups", imageName: "Jackie", category: .girl),
    WodMove(nom: "Angie", subtitle: "Pull-ups, Push-ups, Sit-ups, Air Squats", imageName: "Angie", category: .girl),
    WodMove(nom: "Karen", subtitle: "150 Wall Balls", imageName: "Karen", category: .girl),
    
    // WOD Heroes
    WodMove(nom: "DT", subtitle: "12 Deadlifts, 9 Hang Power Cleans, 6 Push Jerks", imageName: "DT", category: .hero),
    WodMove(nom: "Murph", subtitle: "Le WOD Murph est l’un des WODs “Hero” les plus célèbres dans la communauté CrossFit, conçu pour honorer les soldats tombés au combat. Il se compose d’une course de 1 mile, suivie de 100 pull-ups, 200 push-ups, et 300 squats, avant de terminer par un autre mile de course. Traditionnellement, il est réalisé avec un gilet lesté. Ce WOD est souvent fait chaque année lors du “Memorial Day” pour commémorer le courage et le sacrifice des soldats comme Michael Murphy.      Le WOD Murph est un hommage à Michael P. Murphy, un officier des Navy SEALs américain qui a perdu la vie en Afghanistan en 2005. Connu pour sa bravoure et son sacrifice, il a reçu la Medal of Honor à titre posthume.", imageName: "Murph", category: .hero),
    WodMove(nom: "Wilmot", subtitle: "6 Rounds: 50 Air Squats, 25 Ring Dips", imageName: "Wilmot", category: .hero),
    WodMove(nom: "Jerry", subtitle: "1 Mile Run, 2000m Row, 1 Mile Run", imageName: "Jerry", category: .hero),
    WodMove(nom: "Badger", subtitle: "30 Squat Cleans, 30 Pull-ups, 800m Run", imageName: "Badger", category: .hero),
    WodMove(nom: "Glen", subtitle: "30 Clean and Jerks, 1 Mile Run, Rope Climbs", imageName: "Glen", category: .hero),
    WodMove(nom: "Nate", subtitle: "2 Muscle-ups, 4 Handstand Push-ups, 8 Kettlebell Swings", imageName: "Nate", category: .hero),
]
