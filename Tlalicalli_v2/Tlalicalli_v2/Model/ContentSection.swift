//
//  ContentSection.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 05/11/24.
//

import SwiftUI

struct ContentSection: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var imageName: String
    var content: String
    var backgroundColor: Color
    var icon: String // Nombre del símbolo SF Symbols
    var iconBackgroundColor: Color // Color de fondo del icono
    var questions: [Question]
    var link: URL? // URL opcional para redireccionar a la noticia o video
}
