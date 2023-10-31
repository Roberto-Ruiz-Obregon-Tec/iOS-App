//
//  SignupRepository.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

class SignupRepository: SignUpAPIProtocol {
    let netService: NetworkAPIService
    static let shared = SignupRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func postSignup(model: Signup) async -> ServerResponse<User>? {
        return await netService.post(url: URL(string: "\(API.base)\(API.routes.userSignup)")!, body: model)
    }
}
