//
//  ContentView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = DestinationViewModel()
    @State private var showFullMap = false

    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Image("logoApp2") // Asegúrate de que la imagen esté en tus recursos
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50) // Ajusta el tamaño según tus necesidades
                    .padding(.top, 10)
                
                Text("Tlalicalli")
                    .font(.system(size: 40, weight: .bold, design: .rounded)) // Cambia la fuente, tamaño y peso
                    .foregroundColor(.brown) // Cambia el color según tu preferencia
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5) // Sombra para el texto
                    .padding(.top, 10)
            }
            
            // Mapa pequeño
            MapView(showFullMap: $showFullMap)
                .frame(height: 300)
                .cornerRadius(12)
                .padding(.horizontal)
                .onTapGesture {
                    showFullMap.toggle()
                }
            
            Text("Destinos de Reciclaje")
                .font(.headline)
                .padding(.top, 20)
            
            // Carrusel de tarjetas
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.destinations) { destination in
                        DestinationCard(destination: destination)
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $showFullMap) {
            FullMapView(showFullMap: $showFullMap)
        }
    }
}


