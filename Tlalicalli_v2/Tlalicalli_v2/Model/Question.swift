//
//  Question.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 05/11/24.
//

import SwiftUI

struct Question: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var options: [String] // Opciones de respuesta
    var correctAnswer: String // Opción correcta
    var selectedOption: String? // Opción seleccionada por el usuario
}
