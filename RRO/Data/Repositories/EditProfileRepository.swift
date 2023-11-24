//
//  EditProfileRepository.swift
//  RRO
//
//  Created by Amy Gregg on 11/17/23.
//

import Foundation

class EditProfileRepository: EditProfileAPIProtocol {
    let netService: NetworkAPIService
    static let shared = EditProfileRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getEditProfile() async -> ServerResponse<User>? {
        return await netService
            .get(url: URL(string: "\(API.base)\(API.routes.userInfo)")!)
    }
    
    func patchProfile(model: User) async -> ServerResponse<User>? {
        return await netService
            .patch(url: URL(string: "\(API.base)\(API.routes.updateme)")!, body: model)
    }
}
