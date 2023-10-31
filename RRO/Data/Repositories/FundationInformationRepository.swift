//
//  FundationInformationRepository.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation


class FundationInformationRepository: FundationInformationAPIProtocol {
    let netService: NetworkAPIService
    static let shared = FundationInformationRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getInfoFundation(limit: Int) async -> FoundationResponse<InfoFundation>? {
        let params = [
            "limit": limit
        ]
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.infoFundation)")!, params: params)
        
    }
}

