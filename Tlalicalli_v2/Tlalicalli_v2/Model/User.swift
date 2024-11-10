//
//  User.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 10/11/24.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
}

struct UserManager {
    static let usersKey = "usersKey"

    // Guardar el usuario en UserDefaults
    static func saveUser(_ user: User) {
        var users = fetchUsers()
        users.append(user)
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: usersKey)
        }
    }

    // Obtener todos los usuarios registrados
    static func fetchUsers() -> [User] {
        if let data = UserDefaults.standard.data(forKey: usersKey),
           let users = try? JSONDecoder().decode([User].self, from: data) {
            return users
        }
        return []
    }

    // Verificar si un usuario con el correo electrónico dado existe
    static func userExists(email: String) -> Bool {
        return fetchUsers().contains { $0.email == email }
    }

    // Validar las credenciales del usuario
    static func validateUser(email: String, password: String) -> Bool {
        return fetchUsers().contains { $0.email == email && $0.password == password }
    }
}
