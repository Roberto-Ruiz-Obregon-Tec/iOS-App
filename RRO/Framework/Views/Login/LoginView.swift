//
//  LoginView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct LoginView: View {
    let goMenu: () -> Void
    let goRegister: () -> Void
    let goRestore: () -> Void
    var body: some View {
        VStack {
            Text("Login de Alan")
                .font(.title)
            
            Button {
                goMenu()
            } label: {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8.0)
            }
            
            Button {
                goRestore()
            } label: {
                Text("Olvide mi contraseña")
            }.padding()

            Button {
                goRegister()
            } label: {
                Text("Registrarme")
            }.padding()
        }
    }
}
