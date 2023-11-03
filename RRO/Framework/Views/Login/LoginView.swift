//
//  LoginView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//


import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @State private var showAlert = false
    @State private var email: String = ""
    @State private var password: String = ""
    
    let goMenu: () -> Void
    let goRegister: () -> Void
    let goRestore: () -> Void
    var body: some View {
        
        VStack{
            
            VStack{
                
                Image("logoFundacion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .padding()
                Spacer()
                Text("Fundación")
                    .bold()
                    .font(.title)
                Text("Roberto Ruiz Obregón")
                    .bold()
                    .font(.title)
                Spacer()
                
            }
            
            
            VStack{
                Divider()
                    .padding()
                    .padding()
            }
            
            
            
            
            VStack{
                
                VStack(alignment: .leading, spacing: 0){
                    Text("     Correo Electrónico")
                        .bold()
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                }
                
                VStack(alignment: .leading, spacing: 0){
                    Text("     Contraseña")
                        .bold()
                    SecureField("", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                        .disableAutocorrection(true)
                }
                
            }
            
            VStack{
                Divider()
                    .padding()
                    .padding()
            }
            
            VStack {
                
                Button {
                    if email.isEmpty || password.isEmpty {
                        showAlert = true
                    } else {
                        Task {
                            await viewModel.postLogin(email: email, password: password)
                            // TODO: Handle correctly the error message
                            // if authenticated go to menu
                            // right now it goes anyway
                            goMenu()
                            
                        }
                    }
                } label: {
                    Text("Iniciar sesión")
                }

                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8.0)
                .alert(isPresented: $showAlert) {
                    if email.isEmpty || password.isEmpty {
                        return Alert(
                            title: Text("Campos vacíos"),
                            message: Text("Por favor, completa todos los campos."),
                            dismissButton: .default(Text("OK"))
                        )
                    } else {
                        return Alert(
                            title: Text("Correo o contraseña Incorrecta"),
                            message: Text("El correo o contraseña es incorrecto, por favor, vuelve a intentarlo."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }

                
                Button {
                    goRestore()
                } label: {
                    Text("Olvidé mi contraseña")
                }.padding()
                    .foregroundColor(.gray)
                
                Text("o")
                
                Button {
                    goRegister()
                } label: {
                    Text("Registrarme")
                }.padding()
                    .foregroundColor(.gray)
            }
        }
    }
}


struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(loginRepository: LoginRepository.shared), goMenu: {}, goRegister: {}, goRestore: {})
        /*LoginView(viewModel: LoginViewModel(loginRepository: LoginRepository())) goMenu:{
            ()
        } goRegister: {
            ()
        } goRestore: {
            ()
        }*/
    }
}

