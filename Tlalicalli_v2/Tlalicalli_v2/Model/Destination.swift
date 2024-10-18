import Foundation
import SwiftUI

struct Destination: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var imageName: String  // Nombre de la imagen específica para cada destino
    var category: String    // Categoría de reciclaje
    var latitude: Double    // Agregar latitud
    var longitude: Double   // Agregar longitud
    
    // Propiedad calculada para determinar el color basado en la categoría
    var color: Color {
        switch category {
        case "Electrónicos":
            return .orange
        case "PET":
            return .blue
        case "Vidrio":
            return .green
        case "Papel":
            return .purple
        case "Orgánico":
            return .brown // Puedes elegir el color que prefieras
        default:
            return .gray // Color por defecto
        }
    }
}
