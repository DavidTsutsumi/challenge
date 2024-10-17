//
//  CalendarView.swift
//  Tlalicalli_v2
//
//  Created by Facultad de Contaduría y Administración on 17/10/24.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            Text("Calendar View")
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text("Aquí podrás ver y gestionar tu calendario.")
                .font(.body)
                .padding()
        }
    }
}

#Preview {
    CalendarView()
}
