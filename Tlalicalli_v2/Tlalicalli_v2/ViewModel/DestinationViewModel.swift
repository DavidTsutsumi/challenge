//
//  DestinationViewModel.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

class DestinationViewModel: ObservableObject {
    @Published var destinations: [Destination] = [
        Destination(name: "Capadocia", location: "Turkey", color: .orange, imageName: "capadocia"),
        Destination(name: "Snowland", location: "Cibadak", color: .blue, imageName: "snowland"),
        Destination(name: "Santorini", location: "Greece", color: .purple, imageName: "santorini"),
        Destination(name: "Kyoto", location: "Japan", color: .green, imageName: "kyoto"),
        Destination(name: "Paris", location: "France", color: .pink, imageName: "paris")
    ]
}
