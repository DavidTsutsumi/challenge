//
//  QuestionView.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 05/11/24.
//

import SwiftUI

struct QuestionView: View {
    @State private var selectedOption: String? // Estado para la opción seleccionada
    let question: Question

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Pregunta
            Text(question.text)
                .font(.subheadline)
                .foregroundColor(.black)
            
            // Opciones de respuesta
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    selectedOption = option // Actualiza la opción seleccionada
                }) {
                    HStack {
                        Text(option)
                            .foregroundColor(.black)
                        Spacer()
                        // Indicador de selección y de corrección
                        if let selected = selectedOption {
                            if selected == option {
                                Image(systemName: selected == question.correctAnswer ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(selected == question.correctAnswer ? .green : .red)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray)
                            }
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            // Mensaje de retroalimentación
            if let selected = selectedOption {
                Text(selected == question.correctAnswer ? "¡Correcto!" : "Incorrecto. Intenta de nuevo.")
                    .font(.footnote)
                    .foregroundColor(selected == question.correctAnswer ? .green : .red)
                    .padding(.top, 5)
            }
        }
        .padding(.vertical, 5)
        .onAppear {
            selectedOption = question.selectedOption // Muestra la selección si ya existía
        }
    }
}
