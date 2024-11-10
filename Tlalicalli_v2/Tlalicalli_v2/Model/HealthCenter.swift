//
//  HealthCenter.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 09/11/24.
//
import Foundation
import CoreLocation

struct HealthCenter: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let title: String
    let description: String
    let location: CLLocationCoordinate2D
}
