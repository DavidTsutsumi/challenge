//
//  QuestionView.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 05/11/24.
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    @Binding var selectedOption: String? // Vincula la selección al estado en SectionView

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question.text)
                .font(.subheadline)
                .foregroundColor(.black)
            
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    selectedOption = option // Actualiza la opción seleccionada
                }) {
                    HStack {
                        Text(option)
                            .foregroundColor(.black)
                        Spacer()
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
            
            if let selected = selectedOption {
                Text(selected == question.correctAnswer ? "¡Correcto!" : "Incorrecto. Intenta de nuevo.")
                    .font(.footnote)
                    .foregroundColor(selected == question.correctAnswer ? .green : .red)
                    .padding(.top, 5)
            }
        }
        .padding(.vertical, 5)
    }
}
