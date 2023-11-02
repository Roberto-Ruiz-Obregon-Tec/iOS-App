//
//  LogoutRepository.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 02/11/23.
//

import Foundation

class LogoutRepository: LogoutAPIProtocol {
    let netService: NetworkAPIService
    static let shared = LogoutRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getLogout() async -> ServerResponse<User>? {
        // Crea una URL para la solicitud
        let response: ServerResponse<User>? = await netService
            .get(url: URL(string: "\(API.base)\(API.routes.userLogout)")!)
        
        if let response = response {
            LocalService.shared.removeCurrentSession()
        }
        return response
    }
}
