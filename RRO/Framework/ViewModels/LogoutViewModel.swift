//
//  LogoutViewModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 02/11/23.
//

import Foundation

class LogoutViewModel: ObservableObject {
    @Published var loginViewModel: LoginViewModel
    let logoutRepository: LogoutRepository
    
    init(loginViewModel: LoginViewModel, logoutRepository: LogoutRepository = LogoutRepository()) {
        self.logoutRepository = logoutRepository
        self.loginViewModel = loginViewModel
    }
    
    func getLogout() {
        Task {
            let response = await logoutRepository.getLogout()
            //if response != nil {
            //    loginViewModel.loggedIn = false
            //}
        }
    }
}
