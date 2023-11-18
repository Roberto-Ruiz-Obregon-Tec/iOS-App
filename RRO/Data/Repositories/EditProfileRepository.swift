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
    
    func postEditProfile(model: User) async -> ServerResponse<User>? {
        return await netService
        //need route for user data
            .post(url: URL(string: "\(API.base)\(API.routes.userSignup)")!, body: model)
    }
}
