//
//  LikePublicationRequirement.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 23/11/23.
//

import Foundation

protocol LikePublicationRequirementProtocol {
    func like(publicationId : String) async -> ServerResponse<PublicationPostResponse>?
}


/// Clase para implementar el protocolo
class LikePublicationRequirement : LikePublicationRequirementProtocol {
    static let shared = LikePublicationRequirement()
    let dataRepository : PublicationRepository
    
    init(dataRepository : PublicationRepository = PublicationRepository.shared) { //Singleton
        self.dataRepository = dataRepository // Inicializamos la instancia shared
    }
    
    /// Función del protocolo para recibir los datos de la publicacion
    func like(publicationId : String) async -> ServerResponse<PublicationPostResponse>? {
        return await dataRepository.like(publicationId : publicationId)
    }
    
}
