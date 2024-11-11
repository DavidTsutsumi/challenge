import SwiftUI


class DestinationViewModel: ObservableObject {
    @Published var destinations: [Destination] = [

//        Destination(name: "Centro de materiales tóxicos", location: "Milpa Alta, CDMX", imageName: "toxic-image", category: "Tóxicos", latitude: 19.302787523646636, longitude: -99.10534958031668),
//        Destination(name: "Centro de recoleción de pet", location: "Milpa Alta, CDMX", imageName: "pet-image", category: "PET", latitude: 19.29039416951316, longitude: -99.11663811641877),
//        Destination(name: "Centro de recolección de vidrio", location: "Milpa Alta, CDMX", imageName: "glass-image", category: "Vidrio", latitude: 19.29720140427562, longitude: -99.09219594884253),
//        Destination(name: "Centro de recolección de metales", location: "Milpa Alta, CDMX", imageName: "metal-image", category: "Metales", latitude: 19.26403467866145, longitude: -99.104417634314),
//        Destination(name: "Centro de recolección de carton", location: "Milpa Alta, CDMX", imageName: "cardboard-image", category: "Carton", latitude: 19.262434625555784, longitude: -99.12538146961232),
        //Toxicos
        Destination(name: "Centro de materiales tóxicos", location: "Milpa Alta, CDMX", imageName: "toxic-image", category: "Tóxicos", latitude: 19.302787, longitude: -99.105349),
        Destination(name: "Recolección de químicos domésticos", location: "Milpa Alta, CDMX", imageName: "toxic-image", category: "Tóxicos", latitude: 19.307532, longitude: -99.110489),
//        Destination(name: "Punto de acopio de pintura", location: "Milpa Alta, CDMX", imageName: "toxic-image", category: "Tóxicos", latitude: 19.295721, longitude: -99.098345),
        Destination(name: "Centro de reciclaje de solventes", location: "Milpa Alta, CDMX", imageName: "toxic-image", category: "Tóxicos", latitude: 19.299874, longitude: -99.112890),
        //PET
        Destination(name: "Centro de recolección de PET", location: "Milpa Alta, CDMX", imageName: "pet-image", category: "PET", latitude: 19.290394, longitude: -99.116638),
//        Destination(name: "Acopio de botellas PET", location: "Milpa Alta, CDMX", imageName: "pet-image", category: "PET", latitude: 19.287954, longitude: -99.109876),
        Destination(name: "Reciclaje de envases plásticos", location: "Milpa Alta, CDMX", imageName: "pet-image", category: "PET", latitude: 19.278654, longitude: -99.113452),
        Destination(name: "Punto de reciclaje de PET", location: "Milpa Alta, CDMX", imageName: "pet-image", category: "PET", latitude: 19.302011, longitude: -99.105210),
        //Vidrio
        Destination(name: "Centro de recolección de vidrio", location: "Milpa Alta, CDMX", imageName: "vidrio", category: "Vidrio", latitude: 19.297201, longitude: -99.092196),
        Destination(name: "Reciclaje de botellas de vidrio", location: "Milpa Alta, CDMX", imageName: "vidrio", category: "Vidrio", latitude: 19.299531, longitude: -99.103245),
//        Destination(name: "Acopio de frascos de vidrio", location: "Milpa Alta, CDMX", imageName: "vidrio", category: "Vidrio", latitude: 19.286472, longitude: -99.108976),
        Destination(name: "Punto de reciclaje de vidrio", location: "Milpa Alta, CDMX", imageName: "vidrio", category: "Vidrio", latitude: 19.280401, longitude: -99.117354),
        //Metales
        Destination(name: "Centro de recolección de metales", location: "Milpa Alta, CDMX", imageName: "metal-image", category: "Metales", latitude: 19.264035, longitude: -99.104418),
        Destination(name: "Punto de reciclaje de aluminio", location: "Milpa Alta, CDMX", imageName: "metal-image", category: "Metales", latitude: 19.278451, longitude: -99.109874),
//        Destination(name: "Recolección de chatarra", location: "Milpa Alta, CDMX", imageName: "metal-image", category: "Metales", latitude: 19.290123, longitude: -99.112345),
        Destination(name: "Centro de reciclaje de acero", location: "Milpa Alta, CDMX", imageName: "metal-image", category: "Metales", latitude: 19.282367, longitude: -99.098654),
        //Carton
        Destination(name: "Centro de recolección de cartón", location: "Milpa Alta, CDMX", imageName: "cardboard-image", category: "Cartón", latitude: 19.262435, longitude: -99.125381),
        Destination(name: "Acopio de cajas de cartón", location: "Milpa Alta, CDMX", imageName: "cardboard-image", category: "Cartón", latitude: 19.275641, longitude: -99.110564),
//        Destination(name: "Reciclaje de papel y cartón", location: "Milpa Alta, CDMX", imageName: "cardboard-image", category: "Cartón", latitude: 19.283574, longitude: -99.118237),
        Destination(name: "Punto de recolección de cartón", location: "Milpa Alta, CDMX", imageName: "cardboard-image", category: "Cartón", latitude: 19.278963, longitude: -99.103456),
    ]
}

