//
//  FavoritesView.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 04/11/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @Environment(\.dismiss) var dismiss // Para cerrar la ventana modal

    var body: some View {
        NavigationView {
            List {
                if favoritesManager.favorites.isEmpty {
                    Text("No tienes favoritos todavía.")
                        .foregroundColor(.gray)
                        .italic()
                } else {
                    ForEach(favoritesManager.favorites) { section in
                        // Pasamos `isFavoriteView: true` para evitar que se eliminen los favoritos
                        SectionView(section: section, isFavoriteView: true)
                            .environmentObject(favoritesManager)
                    }
                }
            }
            .navigationTitle("Tus Favoritos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss() // Cierra la ventana modal
                    }
                }
            }
        }
    }
}
