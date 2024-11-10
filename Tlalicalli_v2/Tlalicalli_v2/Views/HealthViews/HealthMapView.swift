//
//  HealthMapView.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 10/11/24.
//
import  SwiftUI
import MapKit

struct HealthMapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var selectedCenter: HealthCenter? = nil
    @State private var showingDetail = false
    
    let healthCenters: [HealthCenter]
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: healthCenters) { center in
            
            MapAnnotation(coordinate: center.location){
                
                Button(action: {
                    
                    selectedCenter = center
                    showingDetail = true
                    
                }){
                    
                    Image(systemName: "mappin")
                        .foregroundColor(.red)
                        .font(.title)
                    
                }
            }
        }
        .frame(height: 300)
        .cornerRadius(10)
        .padding()
        .sheet(item: $selectedCenter){ center in
            HealthCenterDetailView(center: center)
        }
        
    }
}
