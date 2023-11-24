//
//  SignupViewModel.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

enum SigninState {
    case success
    case error
}

class SigninViewModel: ObservableObject {
    @Published var signinData: Signin
    @Published var cp: String
    @Published var age: String
    
    @Published var errorTitle: String
    @Published var errorMessage: String
    @Published var showAlert: Bool
    
    
    private var signupRequirement: SignupRequirementProtocol
    
    init(signupRequirement: SignupRequirementProtocol = SignupRequirement.shared) {
        self.signinData = Signin(firstName: "", lastName: "", age: 0, gender: "Otro", email: "", postalCode: 0, password: "", passwordConfirm: "")
        self.cp = ""
        self.age = ""
        
        self.errorTitle = ""
        self.errorMessage = ""
        self.showAlert = false
        
        self.signupRequirement = signupRequirement
    }
    
    @MainActor
    func postSignup() async -> SigninState {
        self.signinData.postalCode = Int(self.cp) ?? 0
        self.signinData.age = Int(self.age) ?? 0
        
        if isFormIncomplete() {
            self.errorTitle = "Campos vacíos"
            self.errorMessage = "Por favor, completa todos los campos."
            self.showAlert = true
            return .error
        }
        
        guard let response = await signupRequirement.postSignin(model: signinData) else {
            self.errorTitle = "Error con el servidor"
            self.errorMessage = "Vuelve a intentar ingresar o inténtalo más tarde."
            self.showAlert = true
            return .error
        }
        print("Hola")
        guard let token = response.token else {
            self.errorTitle = "Error"
            print("amor")
            self.errorMessage = response.message ?? "..."
            self.showAlert = true
            print("Mama")
            return .error
        }
        print("lol")
        LocalService.shared.setCurrentSession(token: token)
        return .success
        
    }
    
    func isFormIncomplete() -> Bool {
        return signinData.firstName.isEmpty  ||
               signinData.lastName.isEmpty   ||
               signinData.age <= 0           ||
               signinData.age >= 112 ||
               signinData.gender.isEmpty     ||
               signinData.email.isEmpty      ||
               signinData.postalCode < 10000 ||
               signinData.password.isEmpty   ||
               signinData.passwordConfirm.isEmpty
    }
}
