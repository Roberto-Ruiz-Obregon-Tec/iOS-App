//
//  LoginViewModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 24/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var loggedIn: Bool
    let loginRepository: LoginRepository
    

    // Inicializa el ViewModel con un repositorio de inicio de sesión
    init(loginRepository: LoginRepository = LoginRepository()) {
        self.loggedIn = false
        self.loginRepository = loginRepository
    }

    // Función para realizar la solicitud de inicio de sesión
    func postLogin(email: String, password: String) async {
        // Crea un modelo de usuario con campos email y password (se inicializa con un _id vacío)
        let user = Login(email: email, password: password)
        
        let response = await loginRepository.postLogin(model: user)
        if let response = response {
            if response.token != nil {
                self.loggedIn = true
            } else {
                debugPrint(response)
            }
        }
    }
}
