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

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: "leaf.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
                
                VStack(alignment: .leading) {
                    Text(section.title)
                        .font(.headline)
                        .padding(.bottom, 5)

                    HStack {
                        Button(action: {
                            if favoritesManager.isFavorite(section: section) {
                                favoritesManager.removeFromFavorites(section: section)
                            } else {
                                favoritesManager.addToFavorites(section: section)
                            }
                        }) {
                            Image(systemName: favoritesManager.isFavorite(section: section) ? "heart.fill" : "heart")
                                .foregroundColor(favoritesManager.isFavorite(section: section) ? .red : .gray)
                        }
                        Text("¿Te resultó útil esta sección?")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.vertical, 5)

            Image(section.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
                .clipped()

            // Contenido expandible
            if isExpanded {
                Text(section.content)
                    .padding(.bottom)

                // Botón para mostrar preguntas
                Button(action: {
                    showQuestions.toggle() // Cambia la visibilidad de las preguntas
                }) {
                    Text(showQuestions ? "Ocultar Preguntas" : "Preguntas")
                        .foregroundColor(.blue)
                        .padding(.vertical, 5)
                }

                // Mostrar preguntas solo si `showQuestions` es verdadero
                if showQuestions {
                    ForEach(section.questions) { question in
                        QuestionView(question: question)
                    }
                }
            }

            // Botón "Leer más" para expandir el contenido
            Button(action: { isExpanded.toggle() }) {
                Text(isExpanded ? "Leer menos" : "Leer más")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(section.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
