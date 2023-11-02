//
//  ProgramRepository.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

class ProgramRepository: ProgramAPIProtocol {
    let netService: NetworkAPIService
    static let shared = ProgramRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>?{
        let params = [
            "limit": limit,
            "offset": offset
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.program)")!, params: params)
        
    }
    
    func getProgram(id: String) async -> Program? {
        return await netService.self.get(url: URL(string: "\(API.base)/\(API.routes.program)/\(id)")!)
        
    }
}
