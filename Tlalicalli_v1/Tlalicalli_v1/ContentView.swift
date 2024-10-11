import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.323664991292805, longitude:  -99.1867981430983), // Ubicación central
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) // Zoom inicial más alto
    )
    
    // Lugares destacados
    let annotations = [
        PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 19.325698631128972, longitude: -99.18285048215984), title: "Capadocia", subtitle: "Globos aerostáticos"),
        PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 19.323884512327435, longitude: -99.18728040692987), title: "Estambul", subtitle: "Turquía"),
        PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 19.3259424249145, longitude: -99.18609274976869), title: "Ankara", subtitle: "Capital de Turquía")
    ]
    
    @State private var isMapFullScreen = false // Estado para controlar si el mapa está en pantalla completa
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            HStack {
                Text("Hello, Johny")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }
            .padding()

            // Search Bar
            HStack {
                TextField("Where are you going?", text: .constant(""))
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)

            // Icons
            HStack(spacing: 20) {
                IconView(icon: "star.fill", label: "Best Place", color: .orange)
                IconView(icon: "checkmark.circle.fill", label: "Check-in", color: .blue)
                IconView(icon: "doc.text.fill", label: "Articles", color: .yellow)
                IconView(icon: "tag.fill", label: "Promos", color: .green)
            }
            .padding(.vertical)

            // Mapa interactivo
            Map(coordinateRegion: $region, annotationItems: annotations) { place in
                MapMarker(coordinate: place.coordinate, tint: .orange)
            }
            .frame(height: isMapFullScreen ? UIScreen.main.bounds.height : 250) // Si está en pantalla completa, se ajusta al alto de la pantalla
            .cornerRadius(isMapFullScreen ? 0 : 15)
            .padding(.horizontal, isMapFullScreen ? 0 : 16)
            .padding(.vertical, isMapFullScreen ? 0 : 16)
            .edgesIgnoringSafeArea(isMapFullScreen ? .all : .horizontal)
            .onTapGesture {
                withAnimation {
                    isMapFullScreen.toggle() // Cambia el estado al tocar el mapa
                }
            }

            if !isMapFullScreen {
                // Si el mapa no está en pantalla completa, muestra el contenido restante
                Text("Popular Destinations")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        DestinationCard(imageName: "balloon.2.fill", placeName: "Capadocia", country: "Turkey", bgColor: Color(red: 1.0, green: 0.9, blue: 0.8))
                        DestinationCard(imageName: "snow", placeName: "Snowland", country: "Cibadak", bgColor: Color(red: 0.8, green: 0.9, blue: 1.0))
                    }
                    .padding(.horizontal)
                }
            }

            Spacer()
        }
        .background(Color(red: 0.95, green: 1.0, blue: 0.9))
        .edgesIgnoringSafeArea(isMapFullScreen ? .all : .bottom)
    }
}

// Modelo para las anotaciones (lugares destacados)
struct PlaceAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String
}

// Reusable component for the icons
struct IconView: View {
    let icon: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(color)
                .frame(width: 60, height: 60)
                .background(Color(.systemGray5))
                .cornerRadius(30)
            Text(label)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

// Reusable component for destination cards
struct DestinationCard: View {
    let imageName: String
    let placeName: String
    let country: String
    let bgColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            Text(placeName)
                .font(.headline)
                .foregroundColor(.white)
            Text(country)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
            Spacer()
        }
        .frame(width: 200, height: 300)
        .background(bgColor)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

