//
//  MainView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image("mapa")
                    Text("Mapa")
                }
            CalendarView()
                .tabItem {
                    Image("aprende")
                    Text("Aprende")
                }
            HistoryView()
                .tabItem {
                    Image("reciclaje")
                    Text("Reciclaje")
                }
            ProfileView()
                .tabItem {
                    Image("salud")
                    Text("Salud")
                }
        }
        .accentColor(.orange)
    }
}

#Preview {
    MainView()
}
