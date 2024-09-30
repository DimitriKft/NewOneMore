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
    WodMove(nom:
                "Annie",
            subtitle: "Le WOD Annie est un benchmark CrossFit combinant 50, 40, 30, 20, et 10 répétitions de double unders et de sit-ups.    Annie Sakamoto est l’une des athlètes pionnières du CrossFit et fait partie des premières adeptes du mouvement. Elle est surtout connue pour avoir contribué au développement du CrossFit aux côtés de son fondateur, Greg Glassman. Annie a également été coach et compétitrice aux CrossFit Games, gagnant une reconnaissance pour sa passion et son expertise.",
            imageName: "Annie",
            category: .girl),
    WodMove(nom:
                "Fran",
            subtitle: "21, 15, et 9 répétitions de thruster et de pull-ups.",
            imageName: "Fran",
            category:
            .girl),
    WodMove(nom: "Diane",
            subtitle:
                "21, 15, et 9 répétitions de deadlifts et de handstand push-ups. ", imageName:
                "Diane", category:
            .girl),
    WodMove(nom: "Helen",
            subtitle: "400m Run, Kettlebell Swings, Pull-ups",
            imageName: "Helen", category:
            .girl),
    WodMove(nom: "Grace",
            subtitle: "30 Clean and Jerks",
            imageName: "Grace",
            category: .girl),
    WodMove(nom: "Jackie",
            subtitle: "1000m Row, Thrusters, Pull-ups",
            imageName: "Jackie",
            category: .girl),
    WodMove(nom: "Angie",
            subtitle: "Pull-ups, Push-ups, Sit-ups, Air Squats",
            imageName: "Angie",
            category: .girl),
    WodMove(nom: "Karen",
            subtitle: "150 Wall Balls",
            imageName: "Karen",
            category: .girl),
    
    // WOD Heroes
    WodMove(
        nom: "DT",
        subtitle: """
        Le WOD DT est un entraînement Hero dans le CrossFit, dédié à la mémoire du sergent de l’armée de l’air américaine Timothy P. Davis, mort en service en Afghanistan en 2009. Ce WOD est un hommage à son courage et à son sacrifice.

        Le WOD DT se compose de 5 rounds avec une barre chargée, où l’athlète réalise les mouvements suivants :

        • 12 deadlifts (soulevés de terre),
        • 9 hang power cleans (épaulés depuis le haut des genoux),
        • 6 push jerks (épaulés-jetés).

        L’objectif est de compléter les 5 rounds le plus rapidement possible. DT teste principalement la force des athlètes, leur endurance musculaire et leur capacité à maintenir un effort sous fatigue. Il est souvent réalisé avec une charge standard de 70 kg (155 lb) pour les hommes et 47,5 kg (105 lb) pour les femmes. Ce WOD est très apprécié, mais aussi redouté, car il demande de la technique et de l’effort continu, avec des mouvements explosifs tout en gérant la fatigue musculaire.
        """,
        imageName: "DT",
        category: .hero
    ),
    WodMove(
        nom: "Murph",
        subtitle: """
        Le WOD Murph est un entraînement Hero dans le CrossFit, dédié à la mémoire du lieutenant de la Navy SEAL Michael P. Murphy, tombé au combat en Afghanistan en 2005. Ce WOD honore son courage et son sacrifice.

        Le WOD Murph se compose de :

        • 1 mile (1,6 km) de course,
        • 100 pull-ups,
        • 200 push-ups,
        • 300 air squats,
        • 1 mile (1,6 km) de course.

        Traditionnellement, ce WOD est réalisé avec un gilet lesté de 20 lb (9 kg) pour les hommes et de 14 lb (6 kg) pour les femmes. L’objectif est de compléter cet enchaînement le plus rapidement possible. Murph est un test ultime d'endurance et de force mentale, exigeant une gestion efficace de l'effort sur une longue période.
        """,
        imageName: "Murph",
        category: .hero
    ),
    WodMove(
        nom: "Wilmot",
        subtitle: """
        Le WOD Wilmot est un entraînement Hero dans le CrossFit, dédié à la mémoire du sergent de l’armée de l’air américaine Andrew Wilmot, tombé au combat en Afghanistan en 2010. Ce WOD honore son service et son sacrifice.

        Le WOD Wilmot se compose de 6 rounds de :

        • 50 air squats,
        • 25 ring dips.

        L’objectif est de compléter les 6 rounds le plus rapidement possible. Wilmot met à l’épreuve l’endurance musculaire des jambes et des bras, tout en exigeant de la constance dans l'effort. Bien qu’il ne nécessite aucun équipement lourd, ce WOD est éprouvant en raison du volume élevé de répétitions.
        """,
        imageName: "Wilmot",
        category: .hero
    ),
    WodMove(
        nom: "Jerry",
        subtitle: """
        Le WOD Jerry est un entraînement Hero dans le CrossFit, dédié à la mémoire du sergent-chef de l'armée américaine Jerry D. Patton, mort en service en 2008. Ce WOD rend hommage à son service et à son sacrifice.

        Le WOD Jerry se compose de :

        • 1 mile (1,6 km) de course,
        • 2000 mètres de rameur,
        • 1 mile (1,6 km) de course.

        L’objectif est de compléter cet enchaînement le plus rapidement possible. Jerry est un test d'endurance cardiovasculaire et pulmonaire, exigeant à la fois de la vitesse et de la résistance sur de longues distances. Ce WOD ne nécessite pas de poids, mais la charge physique repose sur l'endurance, la régularité et l'effort soutenu.
        """,
        imageName: "Jerry",
        category: .hero
    ),
    WodMove(
        nom: "Badger",
        subtitle: """
        Le WOD Badger est un entraînement Hero dans le CrossFit, dédié à la mémoire du sous-officier de première classe Mark Carter, surnommé "Badger", un Navy SEAL mort en service en Irak en 2007. Ce WOD honore son sacrifice et son service.

        Le WOD Badger se compose de 3 rounds de :

        • 30 squat cleans (42,5 kg / 95 lb),
        • 30 pull-ups,
        • 800 mètres de course.

        L’objectif est de compléter les 3 rounds le plus rapidement possible. Badger combine force et endurance avec un travail intense de squat cleans, de pull-ups, et de course, testant à la fois la résistance musculaire et la capacité cardiovasculaire.
        """,
        imageName: "Badger",
        category: .hero
    ),
    WodMove(
        nom: "Glen",
        subtitle: """
        Le WOD Glen est un entraînement Hero dans le CrossFit, dédié à la mémoire du lieutenant-colonel de l'armée américaine **Glen Doherty**, tué en service lors de l'attaque de Benghazi, en Libye, en 2012. Ce WOD honore son sacrifice et son service.

        Le WOD Glen se compose de :

        • 30 clean and jerks (60 kg / 135 lb),
        • 1 mile (1,6 km) de course,
        • 10 rope climbs (4,5 mètres),
        • 1 mile (1,6 km) de course,
        • 100 burpees.

        L’objectif est de compléter cet enchaînement le plus rapidement possible. Glen est un test d'endurance et de force, combinant des mouvements lourds et techniques avec de l'endurance cardiovasculaire, notamment à travers la course et les burpees.
        """,
        imageName: "Glen",
        category: .hero
    ),
]
