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
    @ObservedObject var viewModel = MedicinalPlantViewModel()
    var healthCenters: [HealthCenter]
    
    var body: some View {

        NavigationView {
        
            ScrollView {
                
                VStack(spacing: 20) {
                    // Sección de encabezado de la vista
                    VStack {
                        
                        Spacer()
                        Text("Salud")
                            .font(.largeTitle)
                            .bold()
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
                                    message: Text("La sección de plantas medicinales promueve el uso responsable de recursos naturales locales, brindando información sobre plantas que contribuyen a la salud y el bienestar de la comunidad. Al recuperar saberes tradicionales sobre el cuidado natural, fomentamos prácticas sustentables y fortalecemos la conexión con la biodiversidad de nuestro entorno, impulsando un desarrollo más sostenible."),
                                    dismissButton: .default(Text("Cerrar")))
                            }
                            
                        }
                        
                        ForEach(viewModel.medicinalPlants) { plant in
                                NavigationLink(destination: PlantDetailView(plant: plant)) {
                                    
                                        MedicinalPlantRow(plant: plant)
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
                        
                        
                        HealthMapView(healthCenters: healthCenters) // El mapa con centros de salud cercanos
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
            }
            //.navigationTitle("Salud")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let healthCenterViewModel = HealthCenterViewModel()
        
        NavigationView {
            
            HealthView(healthCenters: healthCenterViewModel.healthCenters)
            
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
