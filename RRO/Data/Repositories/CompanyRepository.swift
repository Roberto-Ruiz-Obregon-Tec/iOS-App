//
//  CompanyRepository.swift
//  RRO
//
//  Created by Erik Cabrera on 06/11/23.
//

import Foundation

class CompanyRepository: CompanyAPIProtocol {
    let netService: NetworkAPIService
    static let shared = CompanyRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getCompanyList(limit: Int, offset: Int) async -> ServerResponse<[Company]>?{
        let params = [
            "limit": limit,
            "offset": offset
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.company)")!, params: params)
        
    }

}
