//
//  EditProfileRequirement.swift
//  RRO
//
//  Created by Amy Gregg on 11/17/23.
//

import Foundation

protocol EditProfileRequirementProtocol {
    func postEditProfile(model: User) async -> ServerResponse<User>?
}

class EditProfileRequirement: EditProfileRequirementProtocol {
    let dataRepository: EditProfileRepository
    static let shared = EditProfileRequirement()
    
    init(dataRepository: EditProfileRepository = EditProfileRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func postEditProfile(model: User) async -> ServerResponse<User>? {
        return await dataRepository.postEditProfile(model: model)
    }
}
