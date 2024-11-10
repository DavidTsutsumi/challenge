//
//  MedicinalPlantViewModel.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 09/11/24.
//

import SwiftUI

class MedicinalPlantViewModel: ObservableObject {
    
    @Published var medicinalPlants: [MedicinalPlant] = [
            MedicinalPlant(
                name:"Árnica",
                imageName: "arnica",
                description: "Los químicos activos en la árnica pueden reducir la hinchazón, disminuir el dolor y actuar como antibióticos. Pero la árnica puede ser peligrosa cuando se toma por vía oral, a menos que se use en diluciones homeopáticas.",
                recipeSteps: [
                            "Pon una olla con dos litros de agua.",
                            "Agrega lo que tomen tus dedos de árnica.",
                            "Pon una tapa para conservar el calor.",
                            "Déjala hervir a fuego medio.",
                            "Retira del fuego y deja reposar por 10 minutos.",
                            "Cuela el té al servirlo y endulza al gusto."],
                finalImageName: "arnica_tea"),
            
            MedicinalPlant(
                name:"Sábila",
                imageName: "sabila",
                description: "Alivia contusiones, esguinces y dolores",
                recipeSteps: [
                            "Pon una olla con dos litros de agua.",
                            "Agrega lo que tomen tus dedos de árnica.",
                            "Pon una tapa para conservar el calor.",
                            "Déjala hervir a fuego medio.",
                            "Retira del fuego y deja reposar por 10 minutos.",
                            "Cuela el té al servirlo y endulza al gusto."],
                finalImageName: "arnica_tea"),
            
            MedicinalPlant(
                name:"Manzanilla",
                imageName: "manzanilla",
                description: "Alivia contusiones, esguinces y dolores",
                recipeSteps: [
                            "Pon una olla con dos litros de agua.",
                            "Agrega lo que tomen tus dedos de árnica.",
                            "Pon una tapa para conservar el calor.",
                            "Déjala hervir a fuego medio.",
                            "Retira del fuego y deja reposar por 10 minutos.",
                            "Cuela el té al servirlo y endulza al gusto."],
                finalImageName: "arnica_tea")
        ]
    
    
}
