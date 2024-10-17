//
//  DestinationCard.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

struct DestinationCard: View {
    let destination: Destination

    var body: some View {
        VStack {
            Image(destination.imageName) // Usa la imagen específica de cada destino
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 120)
                .clipped()
                .cornerRadius(10)
            
            Text(destination.name)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(destination.location)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(width: 200, height: 250)
        .background(destination.color)
        .cornerRadius(12)
    }
}
