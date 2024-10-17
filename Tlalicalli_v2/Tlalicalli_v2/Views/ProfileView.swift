//
//  ProfileView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View")
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text("Aquí podrás ver y editar tu perfil.")
                .font(.body)
                .padding()
        }
    }
}

#Preview {
    ProfileView()
}
