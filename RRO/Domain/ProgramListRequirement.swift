//
//  ProgramListRequirement.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

// Protocolo que define los requisitos para obtener la lista de programas.
protocol ProgramListRequirementProtocol {
    // Función asincrónica para obtener la lista de programas.
    func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>?
}

// Clase que implementa el protocolo ProgramListRequirementProtocol y maneja la lógica para obtener la lista de programas.
class ProgramListRequirement: ProgramListRequirementProtocol {
    // Propiedad que representa el repositorio de datos para programas.
    let dataRepository: ProgramRepository
    // Instancia compartida de ProgramListRequirement para seguir el patrón de diseño Singleton.
    static let shared = ProgramListRequirement()
    
    // Inicializador de la clase.
    init(dataRepository: ProgramRepository = ProgramRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    // Implementación de la función para obtener la lista de programas.
    func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>? {
        // Utiliza el repositorio de datos para obtener la lista de programas.
        return await dataRepository.getProgramList(limit: limit, offset: offset)
    }
}

