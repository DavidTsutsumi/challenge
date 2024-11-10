//  ProfileView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//


import SwiftUI
import MapKit
import WebKit

struct HealthView: View {
    
    @State private var showInfoAlert = false
    
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
                                                
                        NewsView(
                            title: "Residuos en la localidad",
                            url: URL(string: "https://www.eluniversal.com.mx/metropoli/fotos-rios-de-aguas-negras-brotan-en-milpa-alta-en-riesgo-la-salud-de-mas-de-12-mil-personas/")!,
                            backgroundColor: Color(.systemGray6)
                        )

                        NewsView(
                            title: "Campaña de vacunación",
                            url: URL(string: "https://www.vertigopolitico.com/bienestar/notas/jornada-esterilizacion-y-vacunacion-para-mascotas-en-milpa-alta")!,
                            backgroundColor: Color(.systemGray6)
                        )
                    }
                    .padding(.horizontal)

                    Spacer()
                    
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
                            
                            Button(action: {
                                
                                showInfoAlert = true
                                
                            }) {
                                
                                Image(systemName: "info.circle")
                                    .foregroundColor(Color.blue)
                                
                            }
                            
                            .alert(isPresented: $showInfoAlert){
                                
                                Alert(
                                    title: Text("Informacion"),
                                    message: Text("La importancia de..."),
                                    dismissButton: .default(Text("Cerrar")))
                            }
                            
                        }

                        
                        ForEach(medicinalPlants) { plant in
                                NavigationLink(destination: PlantDetailView(plant: plant)) {
                                    HStack {
                                        Image(plant.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 70)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(plant.name)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                            Text(plant.description)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                                .lineLimit(2)
                                        }
                                        .padding(.leading, 5)
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(12)
                                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 4)
                                }
                            }
                            .padding(.vertical, 5)
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

struct NewsView: View {
    
    let title: String
    let url: URL
    let backgroundColor: Color

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.bottom, 5)

            WebView(url: url)
                .frame(height: 300)
                .cornerRadius(10)
            
            Link(destination: url){
                Text("Ver más")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(5)
            }
            .padding(.top, 10)

        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 4)
    }
}

struct MedicinalPlant: Identifiable {
    
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let recipeSteps: [String]
    let finalImageName: String?
}


struct PlantDetailView: View {
    
    let plant: MedicinalPlant
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text(plant.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                
                // Imagen de la planta
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                // Título centrado de la Descripción
                Text("Descripción")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Descripción con borde y margen
                VStack(alignment: .leading, spacing: 8) {
                    Text(plant.description)
                        .font(.body)
                        .foregroundColor(.black)
                        .padding()
                }
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Título centrado de Receta
                Text("Receta")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                // Receta enumerada en pasos
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(plant.recipeSteps.enumerated()), id: \.0) { index, step in
                        HStack {
                            Text("\(index + 1).")
                                .foregroundColor(.blue) // Números en azul
                            Text(step)
                                .foregroundColor(.black) // Texto en negro
                        }
                        .font(.body)
                        .padding(.horizontal)
                    }
                    
                    // Imagen final de la receta
                    Image(plant.finalImageName ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(10)
                }
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Acción del botón de compartir
                    // Lógica de compartir
                    let activityController = UIActivityViewController(activityItems: [plant.name, plant.description], applicationActivities: nil)
                    if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
                        rootViewController.present(activityController, animated: true)
                    }
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}





let medicinalPlants = [
    
    MedicinalPlant(
        name:"Árnica",
        imageName: "arnica",
        description: "Los químicos activos en la árnica pueden reducir la hinchazón, disminuir el dolor y actuar como antibióticos. Pero la árnica puede ser peligrosa cuando se toma por vía oral, a menos que se use en diluciones homeopáticas.",
        recipeSteps: [
                    "Pon una olla con dos litros de agua.",
                    "Agrega lo que tomen tus dedos de árnica.",
                    "Pon una tapa para conservar el calor.",
                    "Déjala hervir a fuego medio.",
                    "Retira del fuego y deja reposar por 10 minutos.",
                    "Cuela el té al servirlo y endulza al gusto."],
        finalImageName: "arnica_tea"),
    
    MedicinalPlant(
        name:"Sábila",
        imageName: "sabila",
        description: "Alivia contusiones, esguinces y dolores",
        recipeSteps: [
                    "Pon una olla con dos litros de agua.",
                    "Agrega lo que tomen tus dedos de árnica.",
                    "Pon una tapa para conservar el calor.",
                    "Déjala hervir a fuego medio.",
                    "Retira del fuego y deja reposar por 10 minutos.",
                    "Cuela el té al servirlo y endulza al gusto."],
        finalImageName: "arnica_tea"),
    
    MedicinalPlant(
        name:"Manzanilla",
        imageName: "manzanilla",
        description: "Alivia contusiones, esguinces y dolores",
        recipeSteps: [
                    "Pon una olla con dos litros de agua.",
                    "Agrega lo que tomen tus dedos de árnica.",
                    "Pon una tapa para conservar el calor.",
                    "Déjala hervir a fuego medio.",
                    "Retira del fuego y deja reposar por 10 minutos.",
                    "Cuela el té al servirlo y endulza al gusto."],
        finalImageName: "arnica_tea")
]

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

struct HealthMapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var selectedCenter: HealthCenter? = nil
    @State private var showingDetail = false
    
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

// Modelo de Centro de Salud
struct HealthCenter: Identifiable {
    
    let id = UUID()
    let name: String
    let imageName: String
    let title: String
    let description: String
    let location: CLLocationCoordinate2D
    
}


let healthCenters = [
    
    HealthCenter(
        name: "Centro de Salud Salud San Lorenzo Tlacoyucan",
        imageName: "centro_salud_tlacoyucan_image",
        title: "Este complejo ofrece:",
        description: "Consulta Médica Externa Y Odontológica, Inmunizaciones, Trabajo Social, Tamiz Neonatal (Servicio Fines De Semana Y Días Festivos: Consulta De Medicina General, Inmunizaciones Y Detecciones).",
        location: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565)),
    
    HealthCenter(
        name: "Hospital General Milpa Alta",
        imageName: "hospital_general_image",
        title: "Este complejo ofrece:",
        description: "Consulta de especialidad (ginecología, obstetricia, medicina interna, cirugía general, ortopedia, pediatría, colposcopia, odontología, valoración preanestesica y psicología), hosp. De gineco-obst. Medicina interna, pediatría, cirugía general, terapia intensiva, endoscopia, urgencias, rayos x, ultrasonido, mastografía, electrocardiografía, laboratorio, tamiz metabólico y auditivo, nutrición. Tomografía",
        location: CLLocationCoordinate2D(latitude: 19.20159061309685, longitude: -99.01056083756816)),
    
    HealthCenter(
        name: "Centro de Salud Villa Milpa Alta",
        imageName: "centro_salud_villa_image",
        title: "Este complejo ofrece:",
        description: "CONSULTA MEDICA, ODONTOLOGICAY PSICOLOGICA, RAYOS X, LABORATORIO CLINICO, INMUNIZACIONES, FARMACIA, DETECCIONES, PRUEBAS DE DETCCCION DE COVID - 19, TRABAJO SOCIAL, TAMIZ NEONATAL (SERVICIO FINES DE SEMANA Y DÍAS FESTIVOS: CONSULTA DE MEDICINA GENERAL Y ODONTOLOGICA, INMUNIZACIONES Y DETECCIONES).",
        location: CLLocationCoordinate2D(latitude: 19.197271987102017, longitude: -99.01698101480211))
]
