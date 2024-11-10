//
//  MedicinalPlantRow.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 10/11/24.
//
import SwiftUI

struct MedicinalPlantRow: View {
    let plant: MedicinalPlant

    var body: some View {
        HStack {
            Image(plant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(plant.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(plant.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.leading, 5)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}
