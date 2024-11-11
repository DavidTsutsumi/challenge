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
            imageName: "aprende1",
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
                         correctAnswer: "Comunidades indígenas y campesinas"),
                Question(text: "¿Cuál es un servicio ecosistémico que proporcionan las zonas rurales?",
                         options: ["Purificación del agua", "Generación de residuos", "Expansión industrial", "Urbanización"],
                         correctAnswer: "Purificación del agua")
            ],
            link: URL(string: "https://www.sedema.cdmx.gob.mx/")
        ),
        
        ContentSection(
            title: "Beneficios del cuidado ambiental en zonas rurales de México",
            imageName: "aprende2",
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
                         correctAnswer: "Actúan como sumideros de carbono"),
                Question(text: "¿Cuál es un beneficio de la conservación de recursos hídricos?",
                         options: ["Asegura el agua potable", "Incrementa la deforestación", "Contamina los ríos", "Reduce la biodiversidad"],
                         correctAnswer: "Asegura el agua potable")
            ],
            link: URL(string: "https://www.greenpeace.org/mexico/beneficios-del-cuidado-ambiental/")
        ),
        
        ContentSection(
            title: "Principales problemas ambientales en zonas rurales de México",
            imageName: "aprende3",
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
                         correctAnswer: "Erosión del suelo"),
                Question(text: "¿Cuál es una consecuencia de la contaminación del agua en zonas rurales?",
                         options: ["Afecta la salud de las comunidades", "Reduce la erosión", "Incrementa la biodiversidad", "Purifica los ríos"],
                         correctAnswer: "Afecta la salud de las comunidades")
            ],
            link: URL(string: "https://www.fao.org/mexico/noticias/principales-problemas-ambientales/")
        ),
        
        ContentSection(
            title: "Acciones que las comunidades rurales de México pueden tomar",
            imageName: "aprende4",
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
                         correctAnswer: "Genera ingresos y conciencia ambiental"),
                Question(text: "¿Cuál es un beneficio del compostaje en las comunidades rurales?",
                         options: ["Mejora la calidad del suelo", "Incrementa el uso de agroquímicos", "Disminuye la fertilidad del suelo", "Contamina el agua"],
                         correctAnswer: "Mejora la calidad del suelo")
            ],
            link: URL(string: "https://www.conafor.gob.mx/acciones-comunidades/")
        ),
        
        ContentSection(
            title: "Educación ambiental y su importancia",
            imageName: "aprende5",
            content: "La educación ambiental ayuda a crear conciencia sobre la importancia de cuidar el medio ambiente y fomenta prácticas sostenibles en las comunidades.",
            backgroundColor: Color.teal.opacity(0.1),
            icon: "book.fill",
            iconBackgroundColor: Color.teal,
            questions: [
                Question(text: "¿Qué promueve la educación ambiental?",
                         options: ["Conciencia y prácticas sostenibles", "Uso intensivo de recursos", "Expansión urbana", "Industria tecnológica"],
                         correctAnswer: "Conciencia y prácticas sostenibles"),
                Question(text: "¿Cuál es un beneficio de la educación ambiental?",
                         options: ["Conservación de recursos", "Deforestación", "Contaminación", "Expansión agrícola"],
                         correctAnswer: "Conservación de recursos"),
                Question(text: "¿Qué grupo puede beneficiarse de la educación ambiental?",
                         options: ["Comunidades rurales", "Industria minera", "Solo turistas", "Empresas tecnológicas"],
                         correctAnswer: "Comunidades rurales")
            ],
            link: URL(string: "https://www.unesco.org/es/educacion-ambiental/")
        ),
        
        ContentSection(
            title: "Organizaciones y programas de apoyo ambiental en México",
            imageName: "aprende6",
            content: "Diversas organizaciones apoyan el cuidado ambiental en México a través de programas de conservación, educación y apoyo a comunidades.",
            backgroundColor: Color.gray.opacity(0.1),
            icon: "network",
            iconBackgroundColor: Color.gray,
            questions: [
                Question(text: "¿Qué tipo de apoyo ofrecen las organizaciones ambientales en México?",
                         options: ["Programas de conservación", "Expansión de ciudades", "Fomento de agroquímicos", "Destrucción de bosques"],
                         correctAnswer: "Programas de conservación"),
                Question(text: "¿Cuál es una organización que promueve la conservación en México?",
                         options: ["WWF", "Industria minera", "Empresas de tecnología", "Bancos"],
                         correctAnswer: "WWF"),
                Question(text: "¿Qué programa ayuda a la educación ambiental en comunidades?",
                         options: ["Programa de Educación Ambiental de SEMARNAT", "Expansión urbana", "Industria petrolera", "Agricultura intensiva"],
                         correctAnswer: "Programa de Educación Ambiental de SEMARNAT")
            ],
            link: URL(string: "https://www.gob.mx/semarnat/programas")
        )
    ]
}
