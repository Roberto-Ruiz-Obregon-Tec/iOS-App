//
//  SignupRepository.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

class SigninRepository: SigninAPIProtocol {
    let netService: NetworkAPIService
    static let shared = SigninRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func postSignin(model: Signin) async -> ServerResponse<User>? {
        return await netService
            .post(url: URL(string: "\(API.base)\(API.routes.userSignup)")!, body: model)
    }
}
