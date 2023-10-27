//
//  LoginViewModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 24/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    let loginRepository: LoginRepository

    // Inicializa el ViewModel con un repositorio de inicio de sesión
    init(loginRepository: LoginRepository = LoginRepository()) {
        self.loginRepository = loginRepository
    }

    // Función para realizar la solicitud de inicio de sesión
    func postLogin(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Crea un modelo de usuario con campos email y password (se inicializa con un _id vacío)
        let user = User(_id: "", email: email, password: password)

        Task {
            do {
                // Llama a la función postLogin del repositorio para realizar la solicitud
                let result = await loginRepository.postLogin(model: user)
                // Completa la llamada con el resultado (éxito o error)
                completion(result)
            }
        }
    }
}
