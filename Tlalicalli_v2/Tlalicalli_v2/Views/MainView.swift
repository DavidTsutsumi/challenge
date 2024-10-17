import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image("mapa")
                        .resizable()
                        .frame(width: 24, height: 24) // Ajusta el tamaño de los íconos
                    Text("Mapa")
                }
            CalendarView()
                .tabItem {
                    Image("aprende")
                        .resizable()
                        .frame(width: 24, height: 24) // Ajusta el tamaño de los íconos
                    Text("Aprende")
                }
            HistoryView()
                .tabItem {
                    Image("reciclaje")
                        .resizable()
                        .frame(width: 24, height: 24) // Ajusta el tamaño de los íconos
                    Text("Reciclaje")
                }
            ProfileView()
                .tabItem {
                    Image("salud")
                        .resizable()
                        .frame(width: 24, height: 24) // Ajusta el tamaño de los íconos
                    Text("Salud")
                }
        }
        .accentColor(.orange)
    }
}
