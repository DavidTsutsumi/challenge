import SwiftUI

struct MainView: View {
    @StateObject private var favoritesManager = FavoritesManager()
    @StateObject private var healthCenterViewModel = HealthCenterViewModel()
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack {
                        Image("mapa")
                            .resizable()
                            .frame(width: 24, height: 24) // Tamaño adecuado para el icono
                        Text("Mapa")
                    }
                }

            LearnView()
                .tabItem {
                    VStack {
                        Image("aprende")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Aprende")
                    }
                }
                .environmentObject(favoritesManager) // Inyecta FavoritesManager en LearnView

            RecyView()
                .tabItem {
                    VStack {
                        Image("reciclaje")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Reciclaje")
                    }
                }

            HealthView(healthCenters: healthCenterViewModel.healthCenters)
                .tabItem {
                    VStack {
                        Image("salud")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Salud")
                    }
                }
        }
        .accentColor(.blue)
    }
}
