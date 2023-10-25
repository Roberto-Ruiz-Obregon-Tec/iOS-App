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
    @State private var Mail: String = ""
    @State private var Password: String = ""
    
    let goMenu: () -> Void
    let goRegister: () -> Void
    let goRestore: () -> Void
    var body: some View {
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
                TextField("", text: $Mail)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)

            }
                
            VStack(alignment: .leading, spacing: 0){
                Text("     Contraseña")
                    .bold()
                SecureField("", text: $Password)
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
            
            Button("Iniciar sesión") {
                if Mail.isEmpty || Password.isEmpty {
                    showAlert = true
                } else {
                    if viewModel.validateData(mail: Mail, password: Password) == true {
                        goMenu()
                    } else {
                        showAlert = true
                    }
                }
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .alert(isPresented: $showAlert) {
                if Mail.isEmpty || Password.isEmpty {
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

#Preview {
    LoginView(viewModel: LoginViewModel(model: LoginModel())){
        ()
    } goRegister: {
        ()
    } goRestore: {
        ()
    }
}
