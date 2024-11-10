import SwiftUI

struct MainView: View {
    @Binding var isLoggedIn: Bool // Vincula el estado de inicio de sesión
    @StateObject private var favoritesManager = FavoritesManager()
    @StateObject private var healthCenterViewModel = HealthCenterViewModel()
    
    var body: some View {
        NavigationView {
            TabView {
                ContentView()
                    .tabItem {
                        VStack {
                            Image("mapa")
                                .resizable()
                                .frame(width: 24, height: 24)
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
                    .environmentObject(favoritesManager)

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
            .navigationBarItems(trailing: menuButton)
        }
    }

    private var menuButton: some View {
        Menu {
            Button(action: {
                isLoggedIn = false // Cambia el estado de sesión
            }) {
                Label("Cerrar sesión", systemImage: "arrow.backward.circle.fill")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.title2)
                .foregroundColor(.blue)
        }
    }
}

