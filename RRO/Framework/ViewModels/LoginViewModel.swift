//
//  LoginViewModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 24/10/23.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    private var model: LoginModel
    
    init(model: LoginModel) {
        self.model = model
    }
    
    func validateData(mail: String, password: String) -> Bool {
         if mail == model.user.Mail && password == model.user.Password {
             return true // Las credenciales son válidas
         } else {
             return false // Las credenciales no coinciden
         }
     }
 }
