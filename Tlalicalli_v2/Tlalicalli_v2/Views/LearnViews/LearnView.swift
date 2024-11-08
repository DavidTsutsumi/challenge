//
//  HistoryView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

struct LearnView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @StateObject private var viewModel = ContentSectionViewModel() // Crear instancia del ViewModel
    @State private var isShowingFavorites = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center) { // Cambia a .center para centrar el contenido dentro del VStack
                Text("Aprende sobre el Cuidado Ambiental")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center) // Asegura que el título esté centrado horizontalmente
                    .padding(.horizontal)
                
                Text("Aquí encontrarás información importante sobre el cuidado ambiental en zonas rurales de México.")
                    .font(.custom("HelveticaNeue", size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Botón de "Tus Favoritos" centrado
                Button(action: {
                    isShowingFavorites.toggle()
                }) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("Tus Favoritos")
                            .foregroundColor(.blue)
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)

                Divider().padding(.vertical)

                // Usar el ViewModel para iterar sobre las secciones
                ForEach(viewModel.sections) { section in
                    SectionView(section: section)
                        .environmentObject(favoritesManager)
                    Divider().padding(.vertical)
                }
            }
            .padding()
        }
        .sheet(isPresented: $isShowingFavorites) {
            FavoritesView()
                .environmentObject(favoritesManager)
        }
    }
}
