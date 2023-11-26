//
//  CreatePublicationCommentRequirement.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 25/11/23.
//

import Foundation

protocol CreatePublicationCommentProtocol {
    func createPublicationComment(publicationId : String, comment : String) async -> ServerResponse<PublicationPostResponse>?
}


/// Clase para implementar el protocolo
class CreatePublicationCommentRequirement : CreatePublicationCommentProtocol {
    static let shared = CreatePublicationCommentRequirement()
    let dataRepository : PublicationRepository
    
    init(dataRepository : PublicationRepository = PublicationRepository.shared) { //Singleton
        self.dataRepository = dataRepository // Inicializamos la instancia shared
    }
    
    /// Función del protocolo para recibir los datos de la publicacion
    func createPublicationComment(publicationId : String, comment : String) async -> ServerResponse<PublicationPostResponse>? {
        return await dataRepository.createPublicationComment(publicationId : publicationId, comment : comment)
    }
    
}
