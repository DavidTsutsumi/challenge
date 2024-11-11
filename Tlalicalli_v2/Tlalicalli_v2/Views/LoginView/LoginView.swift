//
//  LoginView.swift
//  Tlalicalli_v2
//
//  Created by David Israel Tsutsumi Bernal on 10/11/24.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var showRegisterView: Bool = false

    var body: some View {
        ZStack {
            // Fondo degradado
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.1), Color.green.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                // Título y subtítulo
                VStack(spacing: 8) {
                    Text("Iniciar Sesión")
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                        .foregroundColor(.black)
                    
                    Text("Bienvenido a Tlalicalli")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                }
                
                // Logo de la app
                Image("logoApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.top, 10)

                Spacer()
                
                // Campos de correo y contraseña
                VStack(spacing: 15) {
                    TextField("Correo electrónico", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                    
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Contraseña", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        } else {
                            SecureField("Contraseña", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    }
                }
                
                // Botón de iniciar sesión
                Button(action: {
                    login()
                }) {
                    Text("Iniciar sesión")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 10)
                }
                .padding(.top, 20)
                
                // Botón de diseño de "Iniciar sesión con Apple"
                Button(action: {
                    // No tiene acción, es solo diseño
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Iniciar sesión con Apple")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 10)
                }
                .padding(.top, 10)
                
                // Botón de Crear cuenta
                Button(action: {
                    showRegisterView.toggle() // Muestra la vista de registro
                }) {
                    Text("Crear cuenta")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.blue)
                        .underline()
                }
                .sheet(isPresented: $showRegisterView) {
                    RegisterView() // Muestra la vista de registro como una hoja
                }
                
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 10)
                        .transition(.opacity)
                }
                
                Spacer()
                
                // Recuperar contraseña
                HStack {
                    Text("¿Olvidaste tu contraseña?")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    Button(action: {
                        // Acción para recuperar contraseña
                    }) {
                        Text("Recupérala aquí")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 20)
        }
    }

    private func login() {
        if UserManager.validateUser(email: email, password: password) {
            isLoggedIn = true
        } else {
            errorMessage = "Correo o contraseña incorrectos"
            showError = true
        }
    }
}

