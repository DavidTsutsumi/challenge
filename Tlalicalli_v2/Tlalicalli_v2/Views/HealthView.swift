//  ProfileView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI
import MapKit
import WebKit

struct HealthView: View {
    
    var body: some View {
        
        NavigationView {
        
            ScrollView {
                
                VStack(spacing: 20) {
                    // Sección de encabezado de la vista
                    VStack {
                        
                        Spacer()
                        Text("Salud")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("Aqui encontrarás noticias, campañas y centros de salud de tu localidad")
                            .font(.body)
                            .padding()
                    }
                    
                    // Apartado de Noticias de Salud
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack{
                            Image("noticias")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Noticias")
                                .font(.title)
                                .padding(.bottom, 5)
                        }
                        
                        // Ejemplo de noticia
                        VStack(alignment: .leading){
                            
                            Text("Residuos en la localidad")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            WebView(url: URL(string: "https://www.eluniversal.com.mx/metropoli/fotos-rios-de-aguas-negras-brotan-en-milpa-alta-en-riesgo-la-salud-de-mas-de-12-mil-personas/")!)
                                .frame(height: 300)
                                .cornerRadius(8)
                            
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading){
                            
                            Text("Campaña de vacunación")
                                .font(.headline)
                                .foregroundColor(.blue)
                            
                            WebView(url: URL(string:"https://www.vertigopolitico.com/bienestar/notas/jornada-esterilizacion-y-vacunacion-para-mascotas-en-milpa-alta")!)
                                .frame(height: 300)
                                .cornerRadius(8)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Apartado de Plantas medicinales
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack{
                            Image("plantas")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Plantas medicinales")
                                .font(.title)
                                .padding(.bottom, 5)
                        }
                        
                        
                        List(medicinalPlants){ plant in
                            
                            NavigationLink(destination: PlantDetailView(plant: plant)){
                                
                                HStack {
                                    Image(plant.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    Text(plant.name)
                                        .font(.headline)
                                }
                            }
                        }
                        .frame(height: 300) // Para limitar el tamaño de la lista
                    }
                    .padding(.horizontal)
                    
                    // Apartado de Mapa de Centros de Salud Cercanos
                    VStack(alignment: .leading, spacing: 15) {
                        HStack{
                            
                            Image("centroS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Centros de Salud")
                                .font(.title)
                                .padding(.bottom, 5)
                        }
                        
                        
                        HealthMapView() // El mapa con centros de salud cercanos
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("En tu comunidad")
        }
    }
}

struct HealthMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565), // Coordenadas del centro
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: healthCenters) { center in
            MapMarker(coordinate: center.location, tint: .red)
        }
        .frame(height: 300)
        .cornerRadius(10)
        .padding()
        
    }
}

// Centros de salud cercanos
struct HealthCenter: Identifiable {
    let id = UUID()
    let name: String
    let location: CLLocationCoordinate2D
}

/*Coordenadas
 Centro de salud Salud San Lorenzo Tlacoyucan: 19.179109540913146, -99.02369245713565
 Hospital General: 19.20159061309685, -99.01056083756816
*/
let healthCenters = [
    HealthCenter(name: "Centro de Salud Salud San Lorenzo Tlacoyucan", location: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565)),
    HealthCenter(name: "Hospital General Milpa Alta", location: CLLocationCoordinate2D(latitude: 19.20159061309685, longitude: -99.01056083756816))
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            
            HealthView()
            
        }
    }
}

struct WebView: UIViewRepresentable {
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url:url)
        webView.load(request)
        return webView
    }
}

struct MedicinalPlant: Identifiable {
    
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let recipe: String
}

let medicinalPlants = [
    
    MedicinalPlant(name:"Árnica", imageName: "arnica", description: "Los químicos activos en la árnica pueden reducir la hinchazón, disminuir el dolor y actuar como antibióticos. Pero la árnica puede ser peligrosa cuando se toma por vía oral, a menos que se use en diluciones homeopáticas.", recipe: "Pon una olla con dos litros de agua. Agrega lo que tomen tus dedos de árnica. Pon una tapa para conservar el calor. Déjala hervir a fuego medio. Luego de que hierva debes retirarla del fuego. Déjala reposar durante 10 minutos con la tapa puesta. Cuela el té al servirlo en una taza. Puedes endulzarlo al gusto con miel o azúcar y recuerda que tú puedes secar tu árnica para no usarla fresca. "),
    MedicinalPlant(name:"Sábila", imageName: "sabila", description: "Alivia contusiones, esguinces y dolores", recipe: "Usar con "),
    MedicinalPlant(name:"Manzanilla", imageName: "manzanilla", description: "Alivia contusiones, esguinces y dolores", recipe: "Usar con ")
]

struct PlantDetailView: View {
    
    let plant: MedicinalPlant
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20){
                
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                
                Text(plant.name)
                    .font(.largeTitle)
                    .padding(.top)
                
                Text(plant.description)
                    .font(.body)
                    .padding()
                
                Text("Receta")
                    .font(.headline)
                    .padding(.top)
                
                Text(plant.recipe)
                    .font(.body)
                    .padding()
                
                Spacer()
                
            }
            
            .navigationTitle(plant.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
