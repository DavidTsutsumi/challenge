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
            imageName: "manzanilla",
            content: "Las zonas rurales de México son de gran importancia para la conservación de la biodiversidad y el mantenimiento de servicios ecosistémicos como la regulación del clima y la purificación del agua.",
            backgroundColor: Color.green.opacity(0.1),
            icon: "leaf.fill",
            iconBackgroundColor: Color.green,
            questions: [
                Question(text: "¿Por qué son importantes las zonas rurales en México?",
                         options: ["Proveen servicios ecosistémicos", "No tienen relevancia", "Son zonas para urbanizar", "No afectan la biodiversidad"],
                         correctAnswer: "Proveen servicios ecosistémicos"),
                Question(text: "¿Qué tipo de comunidades habitan las zonas rurales?",
                         options: ["Comunidades indígenas y campesinas", "Solo agricultores", "Únicamente turistas", "Comunidades empresariales"],
                         correctAnswer: "Comunidades indígenas y campesinas")
            ],
            link: URL(string: "https://www.ejemplo.com/introduccion")
        ),
        
        ContentSection(
            title: "Principales problemas ambientales en zonas rurales de México",
            imageName: "manzanilla",
            content: "Las zonas rurales de México enfrentan problemas como la deforestación, la erosión del suelo, la contaminación del agua, y el manejo inadecuado de residuos sólidos.",
            backgroundColor: Color.orange.opacity(0.1),
            icon: "exclamationmark.triangle.fill",
            iconBackgroundColor: Color.orange,
            questions: [
                Question(text: "¿Qué causa la deforestación en zonas rurales?",
                         options: ["Expansión agrícola", "Turismo", "Industria tecnológica", "Población urbana"],
                         correctAnswer: "Expansión agrícola"),
                Question(text: "¿Qué problema ambiental está relacionado con el uso intensivo del suelo?",
                         options: ["Erosión del suelo", "Contaminación del aire", "Aumento de biodiversidad", "Regulación del clima"],
                         correctAnswer: "Erosión del suelo")
            ],
            link: URL(string: "https://www.ejemplo.com/problemas")
        ),
        
        ContentSection(
            title: "Beneficios del cuidado ambiental en zonas rurales de México",
            imageName: "manzanilla",
            content: "El cuidado ambiental en zonas rurales de México trae beneficios como la agricultura sostenible, la conservación de recursos hídricos y la mitigación del cambio climático.",
            backgroundColor: Color.blue.opacity(0.1),
            icon: "hand.thumbsup.fill",
            iconBackgroundColor: Color.blue,
            questions: [
                Question(text: "¿Qué beneficio trae la agricultura sostenible?",
                         options: ["Aumento de fertilidad del suelo", "Reducción de la biodiversidad", "Incremento en el uso de fertilizantes", "Expansión urbana"],
                         correctAnswer: "Aumento de fertilidad del suelo"),
                Question(text: "¿Cómo contribuyen las áreas boscosas a mitigar el cambio climático?",
                         options: ["Actúan como sumideros de carbono", "Generan más residuos", "No tienen impacto", "Aumentan la temperatura"],
                         correctAnswer: "Actúan como sumideros de carbono")
            ],
            link: URL(string: "https://www.ejemplo.com/beneficios")
        ),
        
        ContentSection(
            title: "Acciones que las comunidades rurales de México pueden tomar",
            imageName: "manzanilla",
            content: "Las comunidades rurales en México pueden implementar prácticas sostenibles como la reforestación, la agricultura orgánica, el compostaje y el turismo ecológico.",
            backgroundColor: Color.purple.opacity(0.1),
            icon: "tree.fill",
            iconBackgroundColor: Color.purple,
            questions: [
                Question(text: "¿Cuál es una práctica sostenible en la agricultura?",
                         options: ["Agricultura orgánica", "Uso intensivo de químicos", "Tala de árboles", "Monocultivo sin descanso"],
                         correctAnswer: "Agricultura orgánica"),
                Question(text: "¿Cómo ayuda el turismo ecológico a las comunidades rurales?",
                         options: ["Genera ingresos y conciencia ambiental", "Incrementa la contaminación", "Reduce los ingresos", "Aumenta la deforestación"],
                         correctAnswer: "Genera ingresos y conciencia ambiental")
            ],
            link: URL(string: "https://www.ejemplo.com/acciones")
        )
    ]
}
