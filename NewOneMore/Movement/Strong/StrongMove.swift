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
    StrongMove(nom: "Back Squat", subtitle: "Le squat arrière consiste à fléchir les jambes tout en portant une barre sur les trapèzes. C’est un mouvement de base pour renforcer les cuisses et les fessiers.", imageName: "Back-Squat", category: .halterophilie),
    StrongMove(nom: "Bench Press", subtitle: "Le développé couché est un exercice de musculation ciblant les muscles pectoraux, triceps et épaules en soulevant une barre depuis la poitrine.", imageName: "Bench-Press", category: .musculation),
    StrongMove(nom: "Deadlift", subtitle: "Le soulevé de terre sollicite les muscles du dos, des jambes et des hanches en soulevant une barre depuis le sol jusqu’aux hanches.", imageName: "deadlift", category: .halterophilie),
    
    // Haltérophilie
    StrongMove(nom: "Clean and Jerk", subtitle: "L’épaulé-jeté est un mouvement d’haltérophilie composé de deux phases : l’épaulé pour soulever la barre et le jeté pour la pousser au-dessus de la tête.", imageName: "Clean-And-Jerk", category: .halterophilie),
    StrongMove(nom: "Clean", subtitle: "L’épaulé consiste à soulever une barre du sol jusqu’aux épaules en un mouvement explosif, sollicitant principalement les jambes et les bras.", imageName: "Clean", category: .halterophilie),
    StrongMove(nom: "Front Squat", subtitle: "Le squat avant se pratique avec la barre posée sur l’avant des épaules, sollicitant davantage les quadriceps et le tronc.", imageName: "Front-Squat", category: .halterophilie),
    StrongMove(nom: "Hang Power Clean", subtitle: "Cet épaulé se démarre en position suspendue, juste au-dessus des genoux, pour développer la puissance explosive des jambes.", imageName: "Hang-Power-Clean", category: .halterophilie),
    StrongMove(nom: "Hang Power Snatch", subtitle: "Ce mouvement consiste à arracher la barre du niveau des genoux jusqu’au-dessus de la tête, sans passer en squat complet.", imageName: "Hang-Power-Snatch", category: .halterophilie),
    StrongMove(nom: "Hang Snatch", subtitle: "L'arraché suspendu débute à mi-cuisse et consiste à lever la barre au-dessus de la tête, en passant par un squat complet.", imageName: "Hang-Snatch", category: .halterophilie),
    StrongMove(nom: "Jerk", subtitle: "Le jeté est une poussée de la barre au-dessus de la tête après l’avoir d’abord portée à hauteur des épaules.", imageName: "Jerk", category: .halterophilie),
    StrongMove(nom: "Muscle Clean", subtitle: "L’épaulé sans squat consiste à soulever la barre des genoux aux épaules sans fléchir les jambes pour passer en position de squat.", imageName: "Muscle-Clean", category: .halterophilie),
    StrongMove(nom: "Muscle Snatch", subtitle: "Cet arraché est réalisé sans squat, soulevant la barre directement du sol au-dessus de la tête avec un mouvement continu.", imageName: "Muscle-Snatch", category: .halterophilie),
    StrongMove(nom: "Overhead Squat", subtitle: "Le squat au-dessus de la tête est un mouvement complexe où la barre est maintenue en position haute pendant tout le squat.", imageName: "Overhead-Squat", category: .halterophilie),
    StrongMove(nom: "Power Clean", subtitle: "L’épaulé de puissance consiste à soulever la barre du sol aux épaules sans squat profond, développant explosivité et force.", imageName: "Power-Clean", category: .halterophilie),
    StrongMove(nom: "Power Snatch", subtitle: "L’arraché de puissance permet de lever la barre du sol au-dessus de la tête sans passer par un squat complet.", imageName: "Power-Snatch", category: .halterophilie),
    StrongMove(nom: "Push Press", subtitle: "Le développé poussé consiste à soulever une barre des épaules au-dessus de la tête, en utilisant une légère impulsion des jambes.", imageName: "Push-Press", category: .halterophilie),
    StrongMove(nom: "Snatch", subtitle: "L’arraché est un mouvement explosif d’haltérophilie qui consiste à soulever la barre du sol au-dessus de la tête en un seul mouvement.", imageName: "Snatch", category: .halterophilie),
    StrongMove(nom: "Split Jerk", subtitle: "Le jeté fendu est une variante du jeté classique où les jambes adoptent une position fendue lors de la poussée au-dessus de la tête.", imageName: "Split-Jerk", category: .halterophilie),
    StrongMove(nom: "Squat Clean", subtitle: "L’épaulé avec squat consiste à soulever la barre jusqu’aux épaules puis à descendre en position de squat complet.", imageName: "Squat-Clean", category: .halterophilie),
    StrongMove(nom: "Thruster", subtitle: "Le thruster combine un squat avant et une poussée au-dessus de la tête, sollicitant à la fois les jambes et les épaules.", imageName: "Thruster", category: .halterophilie),
    
    // Musculation
    StrongMove(nom: "Barbell Curl", subtitle: "Le curl à la barre est un exercice ciblant les biceps en fléchissant les bras tout en tenant une barre.", imageName: "Barbell-Curl", category: .musculation),
    StrongMove(nom: "Decline Bench Press", subtitle: "Le développé couché décliné cible principalement les parties inférieures des pectoraux avec un banc incliné vers le bas.", imageName: "Decline-Bench-Press", category: .musculation),
    StrongMove(nom: "Dumbbell Curl", subtitle: "Le curl avec haltères est un exercice pour les biceps réalisé en soulevant des haltères, permettant un mouvement plus libre.", imageName: "Dumbell-Curl", category: .musculation),
    StrongMove(nom: "Shoulder Press", subtitle: "Cet exercice consiste à lever des haltères ou une barre au-dessus de la tête pour travailler les muscles des épaules.", imageName: "Shoulder-Press", category: .musculation),
    StrongMove(nom: "Front Raise", subtitle: "L’élévation frontale renforce les épaules en soulevant des haltères devant soi, bras tendus.", imageName: "Front-Raise", category: .musculation),
    StrongMove(nom: "Hammer Curl", subtitle: "Le curl marteau cible les biceps et avant-bras en tenant les haltères en position neutre.", imageName: "Hammer-Curl", category: .musculation),
    StrongMove(nom: "Incline Bench Press", subtitle: "Le développé incliné met l’accent sur la partie supérieure des pectoraux avec un banc incliné vers le haut.", imageName: "Incline-Bench-Press", category: .musculation),
    StrongMove(nom: "Lateral Raise", subtitle: "L’élévation latérale consiste à lever des haltères sur les côtés, pour cibler les deltoïdes.", imageName: "Lateral-Raise", category: .musculation),
    StrongMove(nom: "Leg Press", subtitle: "La presse à jambes est un exercice de musculation des cuisses où l’on pousse une charge avec les jambes.", imageName: "Leg-Press", category: .musculation),
    StrongMove(nom: "Military Press", subtitle: "Le développé militaire est un exercice pour les épaules, réalisé en poussant une barre au-dessus de la tête.", imageName: "Military-Press", category: .musculation),
    StrongMove(nom: "Pull-Up", subtitle: "Les tractions sont un exercice de musculation au poids du corps, ciblant principalement les dorsaux et les bras.", imageName: "Pull-Up", category: .musculation),
    StrongMove(nom: "Rowing Bar", subtitle: "Le tirage à la barre est un exercice ciblant les muscles du dos, réalisé en tirant une barre vers soi.", imageName: "Rowing-Bar", category: .musculation),
    StrongMove(nom: "Skull Crusher", subtitle: "Cet exercice, réalisé avec une barre, vise les triceps en fléchissant les bras vers le front.", imageName: "Skull-Crusher", category: .musculation),
    StrongMove(nom: "Tricep Dips", subtitle: "Les dips ciblent principalement les triceps, réalisés en abaissant et remontant le corps à l’aide de barres parallèles.", imageName: "Tricep-Dips", category: .musculation)
]
