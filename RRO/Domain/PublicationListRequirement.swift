//
//  PublicationListRequirement.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

protocol PublicationListRequirementProtocol {
    func getPublicationList() async -> ServerResponse<[Publication]>?
}


class PublicationListRequirement : PublicationListRequirementProtocol {
    static let shared = PublicationListRequirement()
    let dataRepository : PublicationRepository
    
    init(dataRepository : PublicationRepository = PublicationRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPublicationList() async -> ServerResponse<[Publication]>? {
        return await dataRepository.getPublicationList()
    }
    
}
