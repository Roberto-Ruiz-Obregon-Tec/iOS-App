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
    
    // If the response of the server isn't nil, the logout succeeds and the message "Sesión cerrada con éxito" is shown.
    func getLogout() async -> ServerResponse<User>? {
        // The URL is formed (API)
        let response: ServerResponse<User>? = await netService
            .get(url: URL(string: "\(API.base)\(API.routes.userLogout)")!)
        
        if response != nil {
            LocalService.shared.removeCurrentSession()
            print("Sesión cerrada con éxito")
        }
        return response
    }
}
