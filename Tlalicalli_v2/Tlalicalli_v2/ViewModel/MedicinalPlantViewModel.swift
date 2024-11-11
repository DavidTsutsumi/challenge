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
                finalImageName: "arnica-Rec"),
            
            MedicinalPlant(
                name:"Sábila",
                imageName: "sabila",
                description: "La sábila, también conocida como aloe vera, es una planta medicinal ampliamente utilizada por sus propiedades curativas y beneficios para la salud. Su gel transparente, que se extrae de las hojas, contiene compuestos activos como vitaminas (A, C, E, y algunas del grupo B), minerales (calcio, magnesio, zinc), enzimas, aminoácidos y antioxidantes.",
                recipeSteps: [
                    "Corta una hoja de sábila y extrae el gel transparente con una cuchara.",
                    "Coloca el gel en un recipiente limpio. Puedes mezclarlo con el aceite de coco y el aceite esencial de lavanda, si deseas.",
                    "Aplica una pequeña cantidad del gel directamente sobre la herida o cicatriz limpia.",
                    "Deja que el gel se absorba y actúe en la piel. No enjuagues inmediatamente."],
                finalImageName: "sabila-Rec"),
            
            MedicinalPlant(
                name:"Manzanilla",
                imageName: "manzanilla",
                description: "La manzanilla, conocida también como Matricaria chamomilla o Chamomilla recutita, es una planta medicinal con múltiples beneficios terapéuticos. Sus flores contienen compuestos activos como flavonoides (apigenina y luteolina), terpenoides, y aceites esenciales, los cuales le confieren propiedades calmantes, antiinflamatorias y antioxidantes.",
                recipeSteps: [
                    "Calienta el agua hasta que empiece a hervir y luego retírala del fuego.",
                    "Agrega las flores de manzanilla al agua caliente (o la bolsita de té) y deja reposar por 5-10 minutos.",
                    "Cuela la infusión, si usaste flores sueltas.",
                    "Añade miel y limón al gusto, si deseas."],
                finalImageName: "manzanilla-Rec")
        ]
    
    
}
