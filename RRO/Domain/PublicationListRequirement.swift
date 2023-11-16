//
//  PublicationListRequirement.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

/// Definición del protocolo
protocol PublicationListRequirementProtocol {
    func getPublicationList() async -> ServerResponse<[Publication]>?
}


/// Clase para implementar el protocolo
class PublicationListRequirement : PublicationListRequirementProtocol {
    static let shared = PublicationListRequirement()
    let dataRepository : PublicationRepository
    
    init(dataRepository : PublicationRepository = PublicationRepository.shared) { //Singleton
        self.dataRepository = dataRepository // Inicializamos la instancia shared
    }
    
    /// Función del protocolo para recibir los datos de la publicacion
    func getPublicationList() async -> ServerResponse<[Publication]>? {
        return await dataRepository.getPublicationList()
    }
    
}
