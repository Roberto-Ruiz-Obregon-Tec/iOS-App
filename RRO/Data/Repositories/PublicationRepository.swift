//
//  PublicationRepository.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

/// Clase para obtener datos de la publicacion a través de la API.
class PublicationRepository : PublicationAPIProtocol {
    let netService : NetworkAPIService
    static let shared = PublicationRepository()
    
    init (netService : NetworkAPIService = NetworkAPIService.shared) { // Singleton
        self.netService = netService // Inicializo la instancia shared de network api service
    }
    
    /// Función para obtener una lista de una publicacion.
    func getPublicationList() async -> ServerResponse<[Publication]>? {
        let params = [ // Parametros a agregar en el request
            "likes[gte]" : 0
        ]
        let h : ServerResponse<[Publication]>? = await netService.self.get(url: URL(string: "\(API.base)\(API.routes.publication)")!, params: params)
        print(h)
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.publication)")!, params: params)
    }
}
