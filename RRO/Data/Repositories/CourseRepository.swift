//
//  CourseRepository.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

/// Clase para obtener datos de cursos a través de la API.
class CourseRepository: CourseAPIProtocol {
    let netService: NetworkAPIService
    static let shared = CourseRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) { // Singleton
        self.netService = netService // Inicializamos la instancia shared
    }
    
    /// Función para obtener una lista de curso.
    func getCourseList() async -> ServerResponse<[Course]>?{
        let params = [ // Parametros a agregar en el request
            "cost[gte]": 0
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)")!, params: params)
    }
    
    /// Función para obtener información de un curso en específico.
    ///
    /// - Parametros:
    ///   - id: El id del curso.
    ///
    /// - Return: La información del curso correspondiente con el id.
    func getCourse(id: String) async -> ServerResponse<[Course]>? {
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)/\(id)")!)
    }
}
