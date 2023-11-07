//
//  LoginViewModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 24/10/23.
//

import Foundation

enum LoginState {
    case success
    case error
}

class LoginViewModel: ObservableObject {
    @Published var loginInfo: Login
    
    @Published var errorTitle: String
    @Published var errorMessage: String
    @Published var showAlert: Bool
    
    let loginRepository: LoginRepository
    

    // Inicializa el ViewModel con un repositorio de inicio de sesión
    init(loginRepository: LoginRepository = LoginRepository()) {
        self.loginInfo = Login(email: "", password: "")
        self.errorTitle = "Error"
        self.errorMessage = "Error"
        self.loginRepository = loginRepository
        self.showAlert = false
        
    }

    // Función para realizar la solicitud de inicio de sesión
    @MainActor
    func postLogin() async -> LoginState {
        
        // Si el campo de email o password está vacío, se manda el mensaje de error.
        if loginInfo.email.isEmpty || loginInfo.password.isEmpty {
            self.errorTitle = "Campos vacíos"
            self.errorMessage = "Por favor, completa todos los campos."
            self.showAlert = true
            return .error
        }
        
        // Si el servidor no regresa una respuesta válida, se regresa el 
        guard let response = await loginRepository.postLogin(model: self.loginInfo) else {
            self.errorTitle = "Error con el servidor"
            self.errorMessage = "Vuelve a intentar ingresar o inténtalo más tarde."
            self.showAlert = true
            return .error
        }
        
        guard let token = response.token else {
            self.errorTitle = "Error"
            self.errorMessage = response.message ?? "..."
            self.showAlert = true
            return .error
        }
        
        LocalService.shared.setCurrentSession(token: token)
        return .success
        
    }
}
