//
//  HealthCenterDetailView.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 10/11/24.
//
import SwiftUI
import CoreLocation

struct HealthCenterDetailView: View {
    let center: HealthCenter

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text(center.name)
                    .font(.largeTitle)
                    .padding(.top)
                
                Image(center.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                
                Text(center.title)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(center.description)
                    .font(.body)
                    .padding()
                
                //Boton indicaciones
                Button(action: {
                    
                    openMaps(for: center.location)
                    
                }){
                    Text("Obtener indicaciones")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                

                Spacer()
            }
            .padding()
        }
        .navigationTitle(center.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func openMaps(for location: CLLocationCoordinate2D){
        
        let url = URL(string: "http://maps.apple.com/?daddr=\(location.latitude),\(location.longitude)")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
}
