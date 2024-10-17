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
            CalendarView()
                .tabItem {
                    Image("aprende")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Aprende")
                }
            HistoryView()
                .tabItem {
                    Image("reciclaje")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Reciclaje")
                }
            ProfileView()
                .tabItem {
                    Image("salud")
                        .resizable()
                        .frame(width: 5, height: 5)
                    Text("Salud")
                }
        }
        .accentColor(.orange)
    }
}
