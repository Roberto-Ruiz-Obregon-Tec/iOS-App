//
//  SignupViewModel.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var signupData: Signup
    var signupRequirement: SignupRequirementProtocol
    
    init(signupRequirement: SignupRequirementProtocol = SignupRequirement.shared) {
        self.signupData = Signup(firstName: "", lastName: "", age: 0, gender: "", email: "", occupation: "", company: "", sociallyResponsibleCompany: "", postalCode: 0, password: "", passwordConfirm: "", profilePicture: "")
        self.signupRequirement = signupRequirement
    }
    
    @MainActor
    func postSignup() async {
        let _ = await signupRequirement.postSignup(model: signupData)
    }
    
}
