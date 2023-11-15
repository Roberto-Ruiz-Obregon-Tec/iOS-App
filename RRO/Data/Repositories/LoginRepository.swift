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
        return await netService
            .post(url: URL(string: "\(API.base)\(API.routes.userLogin)")!, body: model)
        
    }
}
