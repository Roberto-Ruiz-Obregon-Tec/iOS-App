//
//  EventRepository.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

class EventRepository: EventAPIProtocol {
    let netService: NetworkAPIService
    static let shared = EventRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<[Event]>?{
        let params = [
            "limit": limit,
            "offset": offset
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.event)")!, params: params)
        
    }
    
    func getEvent(id: String) async -> Event? {
        return await netService.self.get(url: URL(string: "\(API.base)/\(API.routes.event)/\(id)")!)
        
    }
}
