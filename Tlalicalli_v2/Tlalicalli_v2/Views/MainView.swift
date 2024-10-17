import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image("mapa")
                        .resizable()
                        .frame(width: 5, height: 5)
                    
                }
            LearnView()
                .tabItem {
                    Image("aprende")
                        .resizable()
                        .frame(width: 5, height: 5)
                    
                }
            RecyView()
                .tabItem {
                    Image("reciclaje")
                        .resizable()
                        .frame(width: 5, height: 5)
                    
                }
            HealthView()
                .tabItem {
                    Image("salud")
                        .resizable()
                        .frame(width: 5, height: 5)
                    
                }
        }
        .accentColor(.orange)
    }
}
