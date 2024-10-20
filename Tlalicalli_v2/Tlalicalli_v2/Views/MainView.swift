import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image("mapa")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Mapa")
                }
            LearnView()
                .tabItem {
                    Image("aprende")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Aprende")
                }
            RecyView()
                .tabItem {
                    Image("reciclaje")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Reciclaje")
                }
            HealthView()
                .tabItem {
                    Image("salud")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Salud")
                }
        }
        .accentColor(.blue)
    }
}
