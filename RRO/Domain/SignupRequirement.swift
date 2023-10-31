//
//  SignupRequirement.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

protocol SignupRequirementProtocol {
    func postSignup(model: Signup) async -> ServerResponse<User>?
}

class SignupRequirement: SignupRequirementProtocol {
    let dataRepository: SignupRepository
    static let shared = SignupRequirement()
    
    init(dataRepository: SignupRepository = SignupRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func postSignup(model: Signup) async -> ServerResponse<User>? {
        return await dataRepository.postSignup(model: model)
    }
}
