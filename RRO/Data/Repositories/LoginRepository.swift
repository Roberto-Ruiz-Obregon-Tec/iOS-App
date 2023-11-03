//
//  LoginRepository.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 25/10/23.
//
import Foundation

class LoginRepository: LoginAPIProtocol {
    let netService: NetworkAPIService
    static let shared = LoginRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func postLogin(model: Login) async -> ServerResponse<User>? {
        // Crea una URL para la solicitud
        let response: ServerResponse<User>? = await netService
            .post(url: URL(string: "\(API.base)\(API.routes.userLogin)")!, body: model)
        
        if let response = response {
            print(response)
            LocalService.shared.setCurrentSession(token: response.token ?? "")
        }
        return response
    }
}
