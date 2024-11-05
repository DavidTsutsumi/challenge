//
//  ContentSectionViewModel.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 05/11/24.
//

import SwiftUI

class ContentSectionViewModel: ObservableObject {
    @Published var sections: [ContentSection] = [
        ContentSection(
            title: "Introducción al cuidado ambiental en zonas rurales de México",
            imageName: "milpaAlta",
            content: "En México, las zonas rurales como Milpa Alta son clave para la conservación de la biodiversidad.",
            backgroundColor: Color.green.opacity(0.1),
            questions: [
                Question(text: "¿Por qué es importante conservar las zonas rurales?",
                         options: ["Protección de la biodiversidad", "Fomento de la economía", "Desarrollo urbano", "Reducción de desechos"],
                         correctAnswer: "Protección de la biodiversidad"),
                Question(text: "¿Qué beneficios aportan los ecosistemas en zonas rurales?",
                         options: ["Producción de oxígeno", "Control de plagas", "Desarrollo inmobiliario", "Generación de energía"],
                         correctAnswer: "Producción de oxígeno")
            ]
        ),
        ContentSection(
            title: "Principales problemas ambientales en zonas rurales como Milpa Alta",
            imageName: "deforestacion",
            content: "En zonas rurales de México, los principales problemas ambientales incluyen la deforestación.",
            backgroundColor: Color.orange.opacity(0.1),
            questions: [
                Question(text: "¿Cuáles son los principales factores de deforestación?",
                         options: ["Expansión agrícola", "Urbanización", "Industria", "Erosión"],
                         correctAnswer: "Expansión agrícola"),
                Question(text: "¿Cómo afecta la erosión del suelo a la agricultura?",
                         options: ["Reducción de fertilidad", "Aumento de costos", "Mejora de cultivos", "Mayor disponibilidad de agua"],
                         correctAnswer: "Reducción de fertilidad")
            ]
        )
    ]
}
