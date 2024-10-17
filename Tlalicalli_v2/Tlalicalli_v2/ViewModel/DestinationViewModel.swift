//
//  DestinationViewModel.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

class DestinationViewModel: ObservableObject {
    @Published var destinations: [Destination] = [
        Destination(name: "Capadocia", location: "Turkey", color: .orange),
        Destination(name: "Snowland", location: "Cibadak", color: .blue),
        Destination(name: "Santorini", location: "Greece", color: .purple),
        Destination(name: "Kyoto", location: "Japan", color: .green),
        Destination(name: "Paris", location: "France", color: .pink)
    ]
}
