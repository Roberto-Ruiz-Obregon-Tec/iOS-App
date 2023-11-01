//
//  SigninView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct SigninView: View {
    let goMenu: () -> Void
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: Int?
    @State private var gender: String = ""
    @State private var email: String = ""
    @State private var occupation: String = ""
    @State private var company: String? = ""
    @State private var sociallyResponsibleCompany: Bool? = false
    @State private var postalCode: Int?
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    let maxLength = 5 // La longitud del CP
    // Esto es para el dropdown de ESR
    let opciones = ["N/A", "Falso", "Verdadero"]

    let genero = ["Hombre", "Mujer", "Prefiero no decirlo"]
    // El icono i de ESR
    @State private var showingInfo = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
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
                    HStack{
                        VStack(alignment: .leading, spacing: 0) {
                            Text("     Nombre")
                                .bold()
                            TextField("Obligatorio", text: $firstName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .disableAutocorrection(true)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("      Apellido")
                                .bold()
                            TextField("Obligatorio", text: $lastName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .disableAutocorrection(true)
                        }
                    }
                   
                    VStack{
                    }
                    .padding()
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("     Sexo")
                            .bold()
                        Picker("Obligatorio", selection: $gender) {
                            ForEach(genero, id: \.self) { option in
                                Text(option).tag(option)
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
                    
                    VStack{
                    }
                    .padding()
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("     Edad")
                            .bold()
                        TextField("Obligatorio",value: $age, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            .keyboardType(.numberPad)
                            //.frame(width: 140)
                    }
                    
                    
                    VStack{
                        Divider()
                            .padding()
                            .padding()
                    }

                    
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("     Ocupación")
                            .bold()
                        TextField("Obligatorio", text: $occupation)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                        
                    }
                    
                    VStack{
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("      CP")
                            .bold()
                        TextField("Obligatorio", text: .init(get: {
                            postalCode != nil ? "\(postalCode!)" : ""
                        }, set: {
                            if let newValue = Int($0), newValue < 100000 {
                                postalCode = newValue
                            }
                        }))
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                        .keyboardType(.numberPad)
                        
                        
                        
                        //.frame(width: 140)
                        
                        
                        VStack{
                        }
                        .padding()
                        
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Compañía")
                                .bold()
                            TextField("", text: Binding(
                                get: { self.company ?? "" },
                                set: { self.company = $0 }
                            ))
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            
                        }
                        
                        VStack{
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 0){
                            HStack{
                                Text("     ESR")
                                    .bold()
                                Button(action: {
                                    showingInfo.toggle()
                                }) {
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
                            
                            Picker("", selection: $sociallyResponsibleCompany) {
                                ForEach(0..<opciones.count, id: \.self) { index in
                                    Text(opciones[index])
                                }
                            }
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 9)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.gray)
                        
                        VStack{
                            Divider()
                                .padding()
                                .padding()
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Correo Electrónico")
                                .bold()
                            TextField("Obligatorio", text: $email)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                            
                        }
                        
                        VStack{
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Contraseña")
                                .bold()
                            SecureField("Obligatorio", text: $password)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                                .disableAutocorrection(true)
                        }
                        
                        VStack{
                        }
                        .padding()
                        
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Confirmar Contraseña")
                                .bold()
                            SecureField("Obligatorio", text: $confirmPassword)
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
                            goMenu()
                        } label: {
                            Text("Crear usuario")
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

func convertToBool(from option: String) -> Bool? {
    switch option {
    case "N/A":
        return nil
    case "Falso":
        return false
    case "Verdadero":
        return true
    default:
        return nil
    }
}


#Preview {
    SigninView{()}

}
