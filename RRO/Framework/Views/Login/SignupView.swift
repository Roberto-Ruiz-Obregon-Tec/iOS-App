//
//  SigninView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel = SignupViewModel()
    @State private var showAlert = false
    let goMenu: () -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                Image("logoFundacion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .padding()
                
                Text("Fundación")
                    .bold()
                    .font(.title)
                
                Text("Roberto Ruiz Obregón")
                    .bold()
                    .font(.title)
                
                TextField("Nombre", text: $viewModel.signupData.firstName)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Apellido(s)", text: $viewModel.signupData.lastName)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Correo electrónico", text: $viewModel.signupData.email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                
                TextField("Género", text: $viewModel.signupData.gender)
                    .textFieldStyle(.roundedBorder)
                
                HStack {
                    Text("Edad")
                    Spacer()
                    
                    Picker("Edad", selection: $viewModel.signupData.age) {
                        ForEach(10..<100) {
                            Text("\($0) años")
                        }
                    }
                    .pickerStyle(.menu)
                    
                }.padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 1))
                
                TextField("Ocupación", text: $viewModel.signupData.occupation)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Compañia", text: $viewModel.signupData.company)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Compañía", text: $viewModel.signupData.sociallyResponsibleCompany)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Código postal", value: $viewModel.signupData.postalCode, format: .number)
                    .textFieldStyle(.roundedBorder)
                
                //TextField("Foto de perfil", text: $viewModel.signupData.firstName)
                
                SecureField("Contraseña", text: $viewModel.signupData.password)
                    .textFieldStyle(.roundedBorder)
                    
                SecureField("Confirma contraseña", text: $viewModel.signupData.passwordConfirm)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    Task {
                        await viewModel.postSignup()
                    }
                    //goMenu()
                } label: {
                    Text("Registrarse")
                        .padding()
                }
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8.0)
                
                /*.alert(isPresented: $showAlert) {
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
                }*/
                /*
                Button("Iniciar sesión") {
                    if email.isEmpty || password.isEmpty {
                        showAlert = true
                    } else {
                        viewModel.postLogin(email: email, password: password) { result in
                        switch result {
                            case .success:
                                // Inicio de sesión exitoso, puedes realizar acciones adicionales aquí
                                goMenu()
                            case .failure:
                                // Inicio de sesión fallido, muestra la alerta o maneja el error
                                showAlert = true
                            }
                        }
                    }
                }

                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8.0)
                
                */
                Spacer(minLength: 64)
            }.padding(.horizontal, 32)
        }
        
    }
}

#Preview {
    SignupView(goMenu: {})

}
