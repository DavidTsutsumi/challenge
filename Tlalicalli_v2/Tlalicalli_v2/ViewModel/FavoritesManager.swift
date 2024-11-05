//
//  FavoritesManager.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 04/11/24.
//


import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favorites: [ContentSection] = []

    func addToFavorites(section: ContentSection) {
        if !isFavorite(section: section) {
            favorites.append(section)
        }
    }

    func removeFromFavorites(section: ContentSection) {
        favorites.removeAll { $0.id == section.id }
    }

    func isFavorite(section: ContentSection) -> Bool {
        return favorites.contains(where: { $0.id == section.id })
    }
}
