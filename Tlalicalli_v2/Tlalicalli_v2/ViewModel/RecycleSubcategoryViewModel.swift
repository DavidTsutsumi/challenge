import Foundation

class RecycleSubcategoryViewModel: ObservableObject {
    @Published var subcategories: [RecycleSubcategoryItem] = []

    init() {
        loadSubcategories()
    }

    private func loadSubcategories() {
        subcategories = [
            RecycleSubcategoryItem(
                title: "Tóxicos",
                description: "Lleva los productos químicos a un centro de reciclaje especializado.",
                imageName: "toxicos_icon",
                youtubeLink: "https://www.youtube.com/watch?v=abc123"
            ),
            RecycleSubcategoryItem(
                title: "Orgánicos",
                description: "Los desechos orgánicos pueden ser compostados para enriquecer el suelo.",
                imageName: "organicos_icon",
                youtubeLink: nil
            ),
            RecycleSubcategoryItem(
                title: "Vidrio",
                description: "El vidrio es 100% reciclable y puede reutilizarse múltiples veces.",
                imageName: nil,
                youtubeLink: "https://www.youtube.com/watch?v=def456"
            )
        ]
    }
}

