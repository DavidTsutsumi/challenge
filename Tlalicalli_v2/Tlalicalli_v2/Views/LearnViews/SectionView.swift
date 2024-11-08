//
//  SectionView.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 04/11/24.
//

import SwiftUI

struct SectionView: View {
    let section: ContentSection
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var isExpanded: Bool = false // Controla la expansión del contenido
    @State private var showQuestions: Bool = false // Controla la visibilidad de las preguntas
    @State private var currentQuestionIndex: Int = 0 // Índice de la pregunta actual
    @State private var selectedOptions: [UUID: String] = [:] // Almacena la selección para cada pregunta
    var isFavoriteView: Bool = false // Nueva propiedad para indicar si esta es la vista de favoritos

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Encabezado de la sección con el icono y título
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: section.icon)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(section.iconBackgroundColor)
                    .clipShape(Circle())
                    .font(.system(size: 20))

                VStack(alignment: .leading) {
                    Text(section.title)
                        .font(.headline)
                        .padding(.bottom, 5)
                }
            }
            .padding(.vertical, 5)

            // Imagen de la sección ajustada para ocupar todo el ancho
            Image(section.imageName)
                .resizable()
                .scaledToFill() // Asegura que la imagen se expanda para llenar el ancho
                .frame(maxWidth: .infinity, maxHeight: 150)
                .clipped() // Recorta los bordes de la imagen para que no sobresalga del frame
                .cornerRadius(10)
                .padding(.horizontal) // Añade un padding horizontal opcional para el centrado

            // Contenido expandible
            if isExpanded {
                Text(section.content)
                    .padding(.bottom)

                // Botón para mostrar preguntas
                Button(action: {
                    if !showQuestions {
                        resetQuestions() // Resetear preguntas y el índice cuando se muestran por primera vez
                    }
                    showQuestions.toggle() // Cambia la visibilidad de las preguntas
                }) {
                    Text(showQuestions ? "Ocultar Preguntas" : "Preguntas")
                        .foregroundColor(.blue)
                        .padding(.vertical, 5)
                }
                .buttonStyle(PlainButtonStyle()) // Asegura que este botón tenga estilo simple

                // Mostrar solo una pregunta si `showQuestions` es verdadero
                if showQuestions {
                    let question = section.questions[currentQuestionIndex]
                    QuestionView(question: question, selectedOption: $selectedOptions[question.id])

                    // Botón "Siguiente Pregunta" con el mismo estilo que "Ver más"
                    if currentQuestionIndex < section.questions.count - 1 {
                        Button(action: {
                            // Avanza a la siguiente pregunta
                            currentQuestionIndex += 1
                        }) {
                            Text("Siguiente Pregunta")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(5)
                        }
                        .padding(.top, 5)
                        .buttonStyle(PlainButtonStyle())
                    } else if selectedOptions[question.id] != nil {
                        // Solo muestra el mensaje de finalización si se respondió la última pregunta
                        Text("Has completado todas las preguntas de esta sección.")
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .padding(.top, 10)
                    }
                }
            }

            // Botón "Leer más" para expandir el contenido
            Button(action: { isExpanded.toggle() }) {
                Text(isExpanded ? "Leer menos" : "Leer más")
                    .foregroundColor(.blue)
            }
            .buttonStyle(PlainButtonStyle())
            
            // Botón "Te resultó útil esta sección?" al final
            HStack {
                Button(action: {
                    if !isFavoriteView {
                        if favoritesManager.isFavorite(section: section) {
                            favoritesManager.removeFromFavorites(section: section)
                        } else {
                            favoritesManager.addToFavorites(section: section)
                        }
                    }
                }) {
                    Image(systemName: favoritesManager.isFavorite(section: section) ? "heart.fill" : "heart")
                        .foregroundColor(favoritesManager.isFavorite(section: section) ? .red : .gray)
                }
                Text("¿Te resultó útil esta sección?")
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 10)
            
            // Botón de redirección al final de la sección, pequeño y discreto
            if let link = section.link {
                Link(destination: link) {
                    Text("Ver más")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(5)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(section.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    // Función para reiniciar las preguntas
    private func resetQuestions() {
        currentQuestionIndex = 0 // Reinicia el índice a 0
        selectedOptions = [:] // Limpiar las opciones seleccionadas
    }
}
