//
//  MedicinalPlant.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 09/11/24.
//
import Foundation

struct MedicinalPlant: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let recipeSteps: [String]
    let finalImageName: String?
}
