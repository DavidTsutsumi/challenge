
import SwiftUI

@main
struct Tlalicalli_v2App: App {
    @State private var isLoggedIn: Bool = false // Estado de inicio de sesión

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainView(isLoggedIn: $isLoggedIn) // Pasa el binding a MainView
            } else {
                LoginView(isLoggedIn: $isLoggedIn) // Pasa el binding a LoginView
            }
        }
    }
}
