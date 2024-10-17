//
//  FullMapView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI
import MapKit

struct FullMapView: View {
    @Binding var showFullMap: Bool
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.332, longitude: -99.192),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                showFullMap.toggle()
            }) {
                Image(systemName: "arrow.backward")
                    .font(.title)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}
