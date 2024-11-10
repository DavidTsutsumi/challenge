//
//  HealthCenterViewModel.swift
//  Tlalicalli_v2
//
//  Created by PEDRO on 09/11/24.
//
import SwiftUI
import CoreLocation

class HealthCenterViewModel: ObservableObject {
    
    @Published var healthCenters: [HealthCenter] = [
        
        HealthCenter(
            name: "Centro de Salud Salud San Lorenzo Tlacoyucan",
            imageName: "centro_salud_tlacoyucan_image",
            title: "Este complejo ofrece:",
            description: "Consulta Médica Externa Y Odontológica, Inmunizaciones, Trabajo Social, Tamiz Neonatal (Servicio Fines De Semana Y Días Festivos: Consulta De Medicina General, Inmunizaciones Y Detecciones).",
            location: CLLocationCoordinate2D(latitude: 19.179109540913146, longitude: -99.02369245713565)),
        
        HealthCenter(
            name: "Hospital General Milpa Alta",
            imageName: "hospital_general_image",
            title: "Este complejo ofrece:",
            description: "Consulta de especialidad (ginecología, obstetricia, medicina interna, cirugía general, ortopedia, pediatría, colposcopia, odontología, valoración preanestesica y psicología), hosp. De gineco-obst. Medicina interna, pediatría, cirugía general, terapia intensiva, endoscopia, urgencias, rayos x, ultrasonido, mastografía, electrocardiografía, laboratorio, tamiz metabólico y auditivo, nutrición. Tomografía",
            location: CLLocationCoordinate2D(latitude: 19.20159061309685, longitude: -99.01056083756816)),
        
        HealthCenter(
            name: "Centro de Salud Villa Milpa Alta",
            imageName: "centro_salud_villa_image",
            title: "Este complejo ofrece:",
            description: "CONSULTA MEDICA, ODONTOLOGICAY PSICOLOGICA, RAYOS X, LABORATORIO CLINICO, INMUNIZACIONES, FARMACIA, DETECCIONES, PRUEBAS DE DETCCCION DE COVID - 19, TRABAJO SOCIAL, TAMIZ NEONATAL (SERVICIO FINES DE SEMANA Y DÍAS FESTIVOS: CONSULTA DE MEDICINA GENERAL Y ODONTOLOGICA, INMUNIZACIONES Y DETECCIONES).",
            location: CLLocationCoordinate2D(latitude: 19.197271987102017, longitude: -99.01698101480211))
    ]
}
