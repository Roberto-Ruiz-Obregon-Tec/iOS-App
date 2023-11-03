//
//  SignupRequirement.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

protocol SignupRequirementProtocol {
    func postSignin(model: Signin) async -> ServerResponse<User>?
}

class SignupRequirement: SignupRequirementProtocol {
    let dataRepository: SigninRepository
    static let shared = SignupRequirement()
    
    init(dataRepository: SigninRepository = SigninRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func postSignin(model: Signin) async -> ServerResponse<User>? {
        return await dataRepository.postSignin(model: model)
    }
}
