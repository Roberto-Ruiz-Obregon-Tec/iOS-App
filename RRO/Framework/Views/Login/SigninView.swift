//
//  SigninView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import Combine

struct SigninView: View {
    @ObservedObject var viewModel: SigninViewModel
    let goMenu: () -> Void
    
    let maxLength = 5 // La longitud del CP
    // Esto es para el dropdown de ESR

    let genero = ["Hombre", "Mujer", "Otro"]
    // El icono i de ESR
    @State private var showingInfo = false
    
    var body: some View {
        ScrollView {
            VStack {
                
                // MARK: - Logo
                HStack {
                    Image("logoFundacion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding()
                    
                    VStack {
                        Text("Regístrate")
                            .bold()
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Fundación Roberto Ruiz Obregón")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    
                }
                
                VStack(alignment: .leading, spacing: 0){
                    // MARK: - Names
                    HStack{
                        VStack(alignment: .leading, spacing: 0) {
                            Text("     Nombre")
                                .bold()
                            TextField("Obligatorio", text: $viewModel.signinData.firstName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .disableAutocorrection(true)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("      Apellido")
                                .bold()
                            TextField("Obligatorio", text: $viewModel.signinData.lastName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .disableAutocorrection(true)
                        }
                    }
                    
                    Spacer(minLength: 16)
                    
                    // MARK: - Gender
                    VStack(alignment: .leading, spacing: 0) {
                        Text("     Sexo")
                            .bold()
                        Picker("Obligatorio", selection: $viewModel.signinData.gender) {
                            ForEach(genero, id: \.self) {
                                Text($0)
                            }
                        }
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 9)
                    }
                    .pickerStyle(MenuPickerStyle())
                    .accentColor(.gray)
                            //.frame(width: 140)
                    
                    Spacer(minLength: 16)
                    
                    // MARK: - Age
                    VStack(alignment: .leading, spacing: 0) {
                        Text("     Edad")
                            .bold()
                        TextField("Obligatorio", text: $viewModel.age)
                            .keyboardType(.numberPad)
                            .onReceive(Just(viewModel.age), perform: { newVal in
                                let filtered = newVal.filter { "0123456789".contains($0) }
                                if filtered != newVal {
                                    self.viewModel.age = filtered
                                }
                            })
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            //.frame(width: 140)
                    }
                    
                    
                    VStack{
                        Divider()
                            .padding()
                            .padding()
                    }
                    
                    // MARK: - Occupation
                    VStack(alignment: .leading, spacing: 0){
                        Text("     Ocupación")
                            .bold()
                        TextField("Obligatorio", text: Binding(
                            get: { viewModel.signinData.occupation ?? "" },
                            set: { viewModel.signinData.occupation = $0 })
                        )
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                        
                    }
                    
                    Spacer(minLength: 16)
                    
                    VStack(alignment: .leading, spacing: 0){
                        // MARK: - ZIPCODE
                        Text("      CP")
                            .bold()
                        TextField("Obligatorio", text: $viewModel.cp)
                            .keyboardType(.numberPad)
                            .onReceive(Just(viewModel.cp), perform: { newVal in
                                let filtered = newVal.filter { "0123456789".contains($0) }
                                if filtered != newVal {
                                    self.viewModel.cp = filtered
                                }
                            })
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                        
                        Spacer(minLength: 16)
                        
                        // MARK: - Company
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Compañía")
                                .bold()
                            TextField("", text: Binding(
                                get: { viewModel.signinData.company ?? "" },
                                set: { viewModel.signinData.company = $0 }
                            ))
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            
                        }
                        
                        Spacer(minLength: 16)
                        
                        // MARK: - ESR
                        VStack(alignment: .leading, spacing: 0){
                            Toggle(isOn: Binding(
                                get: { viewModel.signinData.sociallyResponsibleCompany ?? false },
                                set: { viewModel.signinData.sociallyResponsibleCompany = $0 })) {
                                    HStack{
                                        Text("Perteneces a una ESR")
                                            .bold()
                                        
                                        Button{
                                            showingInfo.toggle()
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .foregroundColor(.red)
                                                .alert(isPresented: $showingInfo) {
                                                    Alert(
                                                        title: Text("Empresa Socialmente Responsable"),
                                                        message: Text("Este apartado se refiere a si la empresa a la que perteneces cuenta con la certificación de Empresa Socialmente Responsable (ESR)."),
                                                        dismissButton: .default(Text("Entendido"))
                                                    )
                                                }
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal, 22)
                        
                        VStack{
                            Divider()
                                .padding()
                                .padding()
                        }
                        
                        // MARK: - EMAIL
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Correo Electrónico")
                                .bold()
                            TextField("Obligatorio", text: $viewModel.signinData.email)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                            
                        }
                        
                        Spacer(minLength: 16)
                        
                        // MARK: - PASSWORD
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Contraseña")
                                .bold()
                            SecureField("Obligatorio", text: $viewModel.signinData.password)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .disableAutocorrection(true)
                        }
                        
                        Spacer(minLength: 16)
                        
                        // MARK: - PASSWORD CONFIRM
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Confirmar Contraseña")
                                .bold()
                            SecureField("Obligatorio", text: $viewModel.signinData.passwordConfirm)
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
                                let response = await viewModel.postSignup()
                                
                                switch response {
                                    case .success:
                                        goMenu()
                                    case .error:
                                        break
                                }
                            }
                            //goMenu()
                        } label: {
                            Text("Crear usuario")
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
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

struct SigninViewPreviews: PreviewProvider {
    static var previews: some View {
        SigninView(viewModel: SigninViewModel(), goMenu: {})
    }
}


