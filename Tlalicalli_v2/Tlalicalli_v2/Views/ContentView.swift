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
            Text("Tlalicalli")
                .font(.largeTitle)
                .padding(.top, 20)
            
    
            
            // Mapa pequeño
            MapView(showFullMap: $showFullMap)
                .frame(height: 300)
                .cornerRadius(12)
                .padding(.horizontal)
                .onTapGesture {
                    showFullMap.toggle()
                }
            
            Text("Popular Destinations")
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

#Preview {
    ContentView()
}
