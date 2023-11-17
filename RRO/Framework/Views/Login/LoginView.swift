//
//  LoginView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
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
                    TextField("", text: $viewModel.loginInfo.email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                }
                
                VStack(alignment: .leading, spacing: 0){
                    Text("     Contraseña")
                        .bold()
                    SecureField("", text: $viewModel.loginInfo.password)
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
                    Task {
                        // Id the result of viewModel.postLogin() succeeds, the view changes to the one of Menu, else, there's an error message shown to the user.
                        let result = await viewModel.postLogin()
                        
                        switch result {
                            case .success:
                                goMenu()
                            
                            case .error:
                                break
                        }
                    }
                } label: {
                    Text("Iniciar sesión")
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8.0)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text(viewModel.errorTitle),
                          message: Text(viewModel.errorMessage),
                          dismissButton: .default(Text("OK")))
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

