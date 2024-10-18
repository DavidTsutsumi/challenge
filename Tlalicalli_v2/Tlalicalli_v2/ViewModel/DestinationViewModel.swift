import SwiftUI

//class DestinationViewModel: ObservableObject {
//    @Published var destinations: [Destination] = [
//        Destination(name: "Punto de Reciclaje A", location: "Ubicación A", imageName: "reciclajeA", category: "Electrónicos"),
//        Destination(name: "Punto de Reciclaje B", location: "Ubicación B", imageName: "reciclajeB", category: "PET"),
//        Destination(name: "Punto de Reciclaje C", location: "Ubicación C", imageName: "reciclajeC", category: "Vidrio"),
//        Destination(name: "Punto de Reciclaje D", location: "Ubicación D", imageName: "reciclajeD", category: "Papel"),
//        Destination(name: "Punto de Reciclaje E", location: "Ubicación E", imageName: "reciclajeE", category: "Orgánico"),
//        Destination(name: "Prueba", location: "Ubicación Prueba", imageName: "", category: "1111")
//    ]
//}

class DestinationViewModel: ObservableObject {
    @Published var destinations: [Destination] = [
        Destination(name: "Centro de Reciclaje Milpa Alta", location: "Milpa Alta, CDMX", imageName: "recycle", category: "PET", latitude: 19.3005, longitude: -99.1043),
        Destination(name: "Punto Verde", location: "Milpa Alta, CDMX", imageName: "recycle", category: "Electrónicos", latitude: 19.3050, longitude: -99.1070),
        // Agrega más destinos según sea necesario
    ]
}

