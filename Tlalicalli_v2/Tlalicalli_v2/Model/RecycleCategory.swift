import SwiftUI

struct RecycleItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let description: String
    let youtubeLink: String? // Nueva propiedad opcional para el enlace de YouTube
    let image: String?
}

struct RecycleCategory: Identifiable {
    let id = UUID()
    let title: String
    let items: [RecycleItem]
    let imageName: String
}

//struct RecycleSubcategoryItem: Identifiable {
//    let id = UUID()
//    let title: String
//    let description: String?
//    let imageName: String?
//    let youtubeLink: String?
//}
