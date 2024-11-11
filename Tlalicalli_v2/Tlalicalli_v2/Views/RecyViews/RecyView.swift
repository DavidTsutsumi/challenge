import SwiftUI

struct RecyView: View {
    @StateObject private var viewModel = RecycleViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                // Encabezado principal
                Text("Guía de Reciclaje y Sostenibilidad")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                // Campo de búsqueda
                TextField("Buscar", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                ScrollView {
                    ForEach(viewModel.categories) { category in
                        VStack(alignment: .leading, spacing: 10) {
                            // Título de la categoría con imagen a la izquierda
                            HStack(alignment: .center, spacing: 10) {
                                Image(category.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)

                                Text(category.title)
                                    .font(.headline)
                                    .bold()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color(.systemGray6))
                            )
                            .padding(.horizontal)

                            // Lista de elementos de la categoría
                            ForEach(category.items) { item in
                                NavigationLink(destination: RecycleDetailView(item: item)) {
                                    HStack {
                                        Image(systemName: item.icon)
                                            .foregroundColor(.blue)
                                            .frame(width: 30, height: 30)
                                        Text(item.title)
                                            .font(.body)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(8)
                                    .shadow(color: .gray.opacity(0.1), radius: 1, x: 0, y: 1)
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//Intento Implementacion videos 
//import SwiftUI
//
//struct RecyView: View {
//    @StateObject private var viewModel = RecycleViewModel()
//    @State private var searchText = ""
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Encabezado principal
//                Text("Guía de Reciclaje y Sostenibilidad")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.top)
//
//                // Campo de búsqueda
//                TextField("Buscar", text: $searchText)
//                    .padding(10)
//                    .background(Color(.systemGray6))
//                    .cornerRadius(8)
//                    .padding(.horizontal)
//                    .padding(.bottom, 10)
//
//                ScrollView {
//                    ForEach(viewModel.categories) { category in
//                        VStack(alignment: .leading, spacing: 10) {
//                            // Título de la categoría con imagen a la izquierda
//                            HStack(alignment: .center, spacing: 10) {
//                                Image(category.imageName)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                                    .shadow(radius: 3)
//
//                                Text(category.title)
//                                    .font(.headline)
//                                    .bold()
//                            }
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 40)
//                                    .fill(Color(.systemGray6))
//                            )
//                            .padding(.horizontal)
//
//                            // Lista de elementos de la categoría
//                            ForEach(category.items) { item in
//                                NavigationLink(
//                                    destination: destinationView(for: item)
//                                ) {
//                                    HStack {
//                                        Image(systemName: item.icon)
//                                            .foregroundColor(.blue)
//                                            .frame(width: 30, height: 30)
//                                        Text(item.title)
//                                            .font(.body)
//                                        Spacer()
//                                        Image(systemName: "chevron.right")
//                                            .foregroundColor(.gray)
//                                    }
//                                    .padding()
//                                    .background(Color(.systemBackground))
//                                    .cornerRadius(8)
//                                    .shadow(color: .gray.opacity(0.1), radius: 1, x: 0, y: 1)
//                                }
//                            }
//                        }
//                        .padding(.vertical, 5)
//                    }
//                }
//            }
//            .navigationTitle("")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//
//    // Función para determinar la vista de destino según el tipo de `RecycleItem`
//    @ViewBuilder
//    private func destinationView(for item: RecycleItem) -> some View {
//        // Si tiene un enlace de YouTube, usa `RecycleSubcategoryView`
//        if let youtubeLink = item.youtubeLink, !youtubeLink.isEmpty {
//            YouTubeView(urlString: youtubeLink)
//        } else {
//            // Si no, muestra la vista de detalles estándar
//            RecycleDetailView(item: item)
//        }
//    }
//}
//

#Preview {
    RecyView()
}
