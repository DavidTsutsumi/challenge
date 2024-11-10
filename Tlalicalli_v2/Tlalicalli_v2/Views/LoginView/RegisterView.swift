//
//  RegisterView.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 10/11/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var showSuccessMessage: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Crear Cuenta")
                .font(.largeTitle)
                .bold()

            TextField("Correo electrónico", text: $email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .autocapitalization(.none)

            SecureField("Contraseña", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            SecureField("Confirmar Contraseña", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            Button(action: {
                register()
            }) {
                Text("Registrar")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showSuccessMessage) {
            Alert(
                title: Text("Cuenta creada"),
                message: Text("Tu cuenta ha sido creada exitosamente."),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }

    private func register() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Por favor, completa todos los campos"
            showError = true
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Las contraseñas no coinciden"
            showError = true
            return
        }

        guard !UserManager.userExists(email: email) else {
            errorMessage = "El correo ya está registrado"
            showError = true
            return
        }

        let newUser = User(email: email, password: password)
        UserManager.saveUser(newUser)
        showSuccessMessage = true  // Mostrar mensaje de éxito
    }
}
