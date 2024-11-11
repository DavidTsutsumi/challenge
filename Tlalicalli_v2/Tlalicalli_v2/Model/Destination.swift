import Foundation
import SwiftUI

struct Destination: Identifiable {

    var id = UUID()
    var name: String
    var location: String
    var imageName: String
    var category: String
    var latitude: Double
    var longitude: Double
    
    
    var color: Color {
        switch category {
        case "Tóxicos":
            return .red
        case "PET":
            return .blue
        case "Vidrio":
            return .green
        case "Metales":
            return .purple
        case "Carton":
            return .brown
        case "Orgánico":
            return .orange
        default:
            return .gray
        }
    }
}
