//
//  FundationInformationRepository.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation

/// Repository (FundationInformationRepository) handles foundation information operations in the "RRO" app. It utilizes a network service (NetworkAPIService) for asynchronous operations.
class FundationInformationRepository: FundationInformationAPIProtocol {
    let netService: NetworkAPIService
    static let shared = FundationInformationRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getInfoFundation(limit: Int) async -> ServerResponse<[InfoFundation]>? {
        let params = [
            "limit": limit
        ]
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.infoFundation)")!, params: params)
        
    }
}

