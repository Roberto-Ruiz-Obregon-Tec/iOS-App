//
//  CertificationRepository.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation

class CertificationRepository: CertificationAPIProtocol {
    let netService: NetworkAPIService
    static let shared = CertificationRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getCertificationList(limit: Int) async -> ServerResponse<[Certification]>?{
        let params = [
            "limit": limit
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.certification)")!, params: params)
        
    }
}
