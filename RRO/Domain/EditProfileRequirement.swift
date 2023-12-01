//
//  EditProfileRequirement.swift
//  RRO
//
//  Created by Amy Gregg on 11/17/23.
//

import Foundation

protocol EditProfileRequirementProtocol {
    func getEditProfile() async -> ServerResponse<User>?
    func patchProfile(model: User) async -> ServerResponse<User>?
}

class EditProfileRequirement: EditProfileRequirementProtocol {
    let dataRepository: EditProfileRepository
    static let shared = EditProfileRequirement()
    
    init(dataRepository: EditProfileRepository = EditProfileRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getEditProfile() async -> ServerResponse<User>? {
        return await dataRepository.getEditProfile()
    }
    
    func patchProfile(model: User) async -> ServerResponse<User>? {
        return await dataRepository.patchProfile(model: model)
    }
}
