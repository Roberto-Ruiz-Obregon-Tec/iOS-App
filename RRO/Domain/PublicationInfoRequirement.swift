//
//  PublicationInfoRequirement.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 24/11/23.
//

import Foundation

protocol PublicationInfoRequirementProtocol {
    func getPublicationInfo(publicationId : String) async -> ServerResponse<[Publication]>?
}


/// Clase para implementar el protocolo
class PublicationInfoRequirement : PublicationInfoRequirementProtocol {
    static let shared = PublicationInfoRequirement()
    let dataRepository : PublicationRepository
    
    init(dataRepository : PublicationRepository = PublicationRepository.shared) { //Singleton
        self.dataRepository = dataRepository // Inicializamos la instancia shared
    }
    
    /// Función del protocolo para recibir los datos de la publicacion
    func getPublicationInfo(publicationId : String) async -> ServerResponse<[Publication]>? {
        return await dataRepository.getPublicationInfo(publicationId : publicationId)
    }
    
}
