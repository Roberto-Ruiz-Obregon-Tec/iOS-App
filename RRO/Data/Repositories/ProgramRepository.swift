//
//  ProgramRepository.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

// Clase que implementa el protocolo ProgramAPIProtocol y maneja las operaciones relacionadas con programas.
class ProgramRepository: ProgramAPIProtocol {
    // Propiedad que representa el servicio de red para la comunicación con la API.
    let netService: NetworkAPIService
    // Instancia compartida de ProgramRepository para seguir el patrón de diseño Singleton.
    static let shared = ProgramRepository()
    
    // Inicializador de la clase.
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    // Implementación de la función para obtener la lista de programas.
    func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>?{
        // Construye los parámetros para la solicitud.
        let params = [
            "limit": limit,
            "offset": offset
        ]
        // Utiliza el servicio de red para realizar la solicitud y obtiene la respuesta.
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.program)")!, params: params)
        
    }
    // Implementación de la función para obtener un programa específico por su ID.
    func getProgram(id: String) async -> Program? {
        // Utiliza el servicio de red para realizar la solicitud y obtiene la respuesta.
        return await netService.self.get(url: URL(string: "\(API.base)/\(API.routes.program)/\(id)")!)
        
    }
}
