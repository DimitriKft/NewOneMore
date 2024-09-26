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
    // Street Workout
    BodyWeightMove(nom: "Pull-Up", subtitle: "Les tractions sont un exercice fondamental du street workout qui cible principalement les dorsaux et les bras.", imageName: "Pull-Up", category: .calisthenics),
    BodyWeightMove(nom: "Muscle-Up", subtitle: "Le muscle-up combine une traction suivie d'un passage au-dessus de la barre, sollicitant tout le haut du corps.", imageName: "Muscle-Up", category: .calisthenics),
    BodyWeightMove(nom: "Dips", subtitle: "Les dips sont un mouvement de poussée au poids du corps qui renforce les triceps, les épaules et les pectoraux.", imageName: "Dips", category: .calisthenics),
    BodyWeightMove(nom: "Front Lever", subtitle: "Le front lever est un exercice de gainage avancé, où le corps est maintenu horizontal par la force des bras et du dos.", imageName: "Front-Lever", category: .calisthenics),
    BodyWeightMove(nom: "Back Lever", subtitle: "Le back lever est un mouvement de force statique où le corps est maintenu horizontal face au sol, demandant un contrôle total du corps.", imageName: "Back-Lever", category: .calisthenics),
    BodyWeightMove(nom: "Human Flag", subtitle: "La figure de drapeau humain est un mouvement impressionnant de street workout qui requiert une énorme force des épaules et des abdominaux.", imageName: "Human-Flag", category: .calisthenics),
    BodyWeightMove(nom: "Pistol Squat", subtitle: "Le pistol squat est un squat unilatéral profond, exécuté sur une jambe pour renforcer les jambes et améliorer l’équilibre.", imageName: "Pistol-Squat", category: .calisthenics),
    BodyWeightMove(nom: "Dragon Flag", subtitle: "Le dragon flag est un exercice avancé de renforcement des abdominaux, popularisé par Bruce Lee.", imageName: "Dragon-Flag", category: .calisthenics),
    BodyWeightMove(nom: "One-Arm Pull-Up", subtitle: "Une version avancée de la traction, effectuée avec un seul bras, sollicitant intensément les dorsaux et les bras.", imageName: "One-Arm-Pull-Up", category: .calisthenics),
    BodyWeightMove(nom: "Planche", subtitle: "La planche est un exercice de force statique dans lequel le corps est maintenu horizontalement avec les bras tendus.", imageName: "Planche", category: .calisthenics),
    BodyWeightMove(nom: "Handstand Push-Up", subtitle: "Les pompes en équilibre sont une version avancée des pompes qui se concentrent sur la force des épaules et la stabilité du tronc.", imageName: "Handstand-Push-Up", category: .calisthenics),
    
    // Gymnastique
    BodyWeightMove(nom: "Ring Muscle-Up", subtitle: "Le muscle-up aux anneaux est une variante du muscle-up qui utilise des anneaux de gymnastique pour ajouter une instabilité supplémentaire.", imageName: "Ring-Muscle-Up", category: .gymnastique),
    BodyWeightMove(nom: "Iron Cross", subtitle: "La croix de fer est un exercice iconique de gymnastique où les bras sont maintenus horizontaux tout en suspendant le corps aux anneaux.", imageName: "Iron-Cross", category: .gymnastique),
    BodyWeightMove(nom: "Back Flip", subtitle: "Le saut arrière est un mouvement acrobatique de gymnastique qui demande un saut et une rotation arrière complète.", imageName: "Back-Flip", category: .gymnastique),
    BodyWeightMove(nom: "Front Flip", subtitle: "Le saut avant est une figure de gymnastique qui consiste à effectuer une rotation avant après un saut.", imageName: "Front-Flip", category: .gymnastique),
    BodyWeightMove(nom: "Handstand", subtitle: "L'équilibre sur les mains est une figure basique en gymnastique, mettant l'accent sur la force des épaules et l'équilibre.", imageName: "Handstand", category: .gymnastique),
    BodyWeightMove(nom: "L-Sit", subtitle: "Le L-Sit est un exercice de gymnastique réalisé en position assise sur des barres parallèles, les jambes tendues et le corps levé.", imageName: "L-Sit", category: .gymnastique),
    BodyWeightMove(nom: "Ring Dip", subtitle: "Les dips aux anneaux sont une version plus instable et difficile des dips classiques, exigeant plus de contrôle et de force.", imageName: "Ring-Dip", category: .gymnastique),
    BodyWeightMove(nom: "Back Lever (Rings)", subtitle: "Le back lever aux anneaux est similaire au back lever, mais l'instabilité des anneaux ajoute une difficulté supplémentaire.", imageName: "Back-Lever-Rings", category: .gymnastique),
    BodyWeightMove(nom: "Forward Roll (Rings)", subtitle: "La roulade avant aux anneaux est un mouvement de gymnastique acrobatique combinant contrôle et coordination.", imageName: "Forward-Roll-Rings", category: .gymnastique),
    BodyWeightMove(nom: "Maltese Cross", subtitle: "La croix maltaise est une figure extrêmement avancée de gymnastique, demandant une grande force pour maintenir le corps parallèle au sol avec les bras tendus.", imageName: "Maltese-Cross", category: .gymnastique),
    BodyWeightMove(nom: "Pike Hold", subtitle: "Le pike hold est une position statique avancée de gymnastique où les jambes sont tenues en position de pike avec les mains au sol.", imageName: "Pike-Hold", category: .gymnastique)
]
