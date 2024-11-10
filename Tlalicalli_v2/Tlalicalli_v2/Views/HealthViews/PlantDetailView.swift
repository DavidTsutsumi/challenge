//
//  PlantDetailView.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 10/11/24.
//

import SwiftUI

struct PlantDetailView: View {
    
    let plant: MedicinalPlant
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text(plant.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                
                // Imagen de la planta
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                // Título centrado de la Descripción
                Text("Descripción")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Descripción con borde y margen
                VStack(alignment: .leading, spacing: 8) {
                    Text(plant.description)
                        .font(.body)
                        .foregroundColor(.black)
                        .padding()
                }
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Título centrado de Receta
                Text("Receta")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                // Receta enumerada en pasos
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(plant.recipeSteps.enumerated()), id: \.0) { index, step in
                        HStack {
                            Text("\(index + 1).")
                                .foregroundColor(.blue) // Números en azul
                            Text(step)
                                .foregroundColor(.black) // Texto en negro
                        }
                        .font(.body)
                        .padding(.horizontal)
                    }
                    
                    // Imagen final de la receta
                    Image(plant.finalImageName ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(10)
                }
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Acción del botón de compartir
                    // Lógica de compartir
                    let activityController = UIActivityViewController(activityItems: [plant.name, plant.description], applicationActivities: nil)
                    if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
                        rootViewController.present(activityController, animated: true)
                    }
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
