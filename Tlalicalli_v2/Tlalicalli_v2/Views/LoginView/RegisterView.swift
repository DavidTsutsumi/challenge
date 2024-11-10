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
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isSuccess: Bool = false
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
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isSuccess ? "Cuenta creada" : "Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) {
                    if isSuccess {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }

    private func register() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            alertMessage = "Por favor, completa todos los campos"
            isSuccess = false
            showAlert = true
            return
        }

        guard password == confirmPassword else {
            alertMessage = "Las contraseñas no coinciden"
            isSuccess = false
            showAlert = true
            return
        }

        guard !UserManager.userExists(email: email) else {
            alertMessage = "El correo ya está registrado"
            isSuccess = false
            showAlert = true
            return
        }

        let newUser = User(email: email, password: password)
        UserManager.saveUser(newUser)
        alertMessage = "Tu cuenta ha sido creada exitosamente."
        isSuccess = true
        showAlert = true
    }
}
