//
//  ScholarshipRepository.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

class ScholarshipRepository: ScholarshipAPIProtocol {
    let netService: NetworkAPIService
    static let shared = ScholarshipRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getScholarshipList(limit: Int, offset: Int) async -> [Scholarship]? {
        let params = [
            "limit": limit,
            "offset": offset
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.scholarship)")!, params: params)
        
    }
    
    func getScholarship(id: String) async -> Scholarship? {
        return await netService.self.get(url: URL(string: "\(API.base)/\(id)")!)
        
    }
}
