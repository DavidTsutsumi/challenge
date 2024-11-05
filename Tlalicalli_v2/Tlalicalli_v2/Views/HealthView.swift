//  ProfileView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//


import SwiftUI
import MapKit

struct HealthView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Sección de encabezado de la vista
                VStack {
                    Spacer()
                    Text("Salud")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("Aquí encontrarás noticias, campañas y centros de salud de tu localidad")
                        .font(.body)
                        .padding()
                }
                
                // Apartado de Noticias de Salud
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image("noticias")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Noticias")
                            .font(.title)
                            .padding(.bottom, 5)
                    }
                    
                    // Ejemplo de noticia
                    Link(destination: URL(string: "https://www.eluniversal.com.mx/metropoli/fotos-rios-de-aguas-negras-brotan-en-milpa-alta-en-riesgo-la-salud-de-mas-de-12-mil-personas/")!) {
                        VStack(alignment: .leading) {
                            Text("Residuos en la localidad")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text("Una tubería de líquido residual colapsó y puede contaminar un pozo lo que pone en riesgo la salud de más de 12 mil habitantes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                    
                    Link(destination: URL(string: "https://www.otra-noticia.com")!) {
                        VStack(alignment: .leading) {
                            Text("Campaña de vacunación")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text("Resumen de esta otra noticia...")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                // Apartado de Plantas Medicinales
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image("plantas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Plantas medicinales")
                            .font(.title)
                            .padding(.bottom, 5)
                    }
                    
                    // Usamos LazyVStack en lugar de List, para evitar conflictos con ScrollView
                    LazyVStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Árnica")
                                .font(.headline)
                                .padding(.bottom, 2)
                            Text("1. Alivia contusiones, esguinces y dolores musculares")
                            Text("2. Usada en cremas y ungüentos para aliviar el dolor.")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Sábila")
                                .font(.headline)
                                .padding(.bottom, 2)
                            Text("1. Tiene propiedades cicatrizantes y antiinflamatorias.")
                            Text("2. Utilizada en tratamientos para quemaduras menores.")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Manzanilla")
                                .font(.headline)
                                .padding(.bottom, 2)
                            Text("1. Se usa comúnmente como digestivo y para aliviar cólicos.")
                            Text("2. Conocida por sus propiedades calmantes.")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                // Apartado de Mapa de Centros de Salud Cercanos
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image("centroS")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Centros de Salud")
                            .font(.title)
                            .padding(.bottom, 5)
                    }
                    
                    // Mapa de Centros de Salud
                    HealthMapView()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct HealthMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: healthCenters) { center in
            MapMarker(coordinate: center.location, tint: .red)
        }
        .frame(height: 300)
        .cornerRadius(10)
    }
}

// Modelo de Centro de Salud
struct HealthCenter: Identifiable {
    let id = UUID()
    let name: String
    let location: CLLocationCoordinate2D
}

// Lista de Centros de Salud Cercanos
let healthCenters = [
    HealthCenter(name: "Centro de Salud Salud San Lorenzo Tlacoyucan", location: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565)),
    HealthCenter(name: "Hospital General Milpa Alta", location: CLLocationCoordinate2D(latitude: 19.20159061309685, longitude: -99.01056083756816))
]
