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
            Image(systemName: "figure.walk")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(destination.name)
                .font(.headline)
                .foregroundColor(.white)
            Text(destination.location)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(width: 200, height: 250)
        .background(destination.color)  // Usar el color del modelo
        .cornerRadius(12)
    }
}
