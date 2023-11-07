//
//  CertificationRepository.swift
//  RRO
//
//  Creado por Sebastian Jimenez Bauer el 30/10/23.
//

import Foundation

/// Definimos una clase llamada CertificationRepository. protocolo CertificationAPIProtocol.
class CertificationRepository: CertificationAPIProtocol {
    let netService: NetworkAPIService
    static let shared = CertificationRepository()
    
    /// Inicializamos CertificationRepository con un parámetro opcional netService, que por defecto usa la instancia compartida de NetworkAPIService.
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    /// Implementamos la función getCertificationList que obtiene una lista de certificaciones de forma asíncrona.
    /// - Parameter limit: limit description
    /// - Returns: Lista de certificaciones
    func getCertificationList(limit: Int) async -> ServerResponse<[Certification]>? {
        let params = [
            "limit": limit
        ]
        
        return await netService.get(url: URL(string: "\(API.base)\(API.routes.certification)")!, params: params)
    }
}
