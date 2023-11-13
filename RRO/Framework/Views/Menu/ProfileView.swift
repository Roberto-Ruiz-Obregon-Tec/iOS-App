//
//  ProfileView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var logoutViewModel: LogoutViewModel
    let goLogin: () -> Void
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Image(systemName: "person")
                        .font(.largeTitle)
                    
                    Text("Perfil")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                NavigationLink(destination: ProfileDetailView()) {
                    Text("Editar perfil")
                        .padding()
                }
                
                Button(action: {
                    // The logout is executed
                    logoutViewModel.getLogout()
                    goLogin()
                }) {
                    Text("Cerrar sesión")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .font(.headline)
                }
            }
        }
    }
}

struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        // Asegúrate de crear instancias válidas de LogoutViewModel y LoginViewModel
        let logoutViewModel = LogoutViewModel(loginViewModel: LoginViewModel())
    }
}
