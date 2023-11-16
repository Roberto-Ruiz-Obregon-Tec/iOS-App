//
//  PublicationRepository.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

class PublicationRepository : PublicationAPIProtocol {
    let netService : NetworkAPIService
    static let shared = PublicationRepository()
    
    init (netService : NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getPublicationList() async -> ServerResponse<[Publication]>? {
        let params = [
            "likes[gte]" : 0
        ]

        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.publication)")!, params: params)
    }
}
