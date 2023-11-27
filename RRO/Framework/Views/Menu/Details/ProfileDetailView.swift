//
//  ProfileDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//  Edited by Amy on 14/11/23.

import SwiftUI
import SDWebImageSwiftUI

struct ProfileDetailView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    
    let maxLength = 5 // La longitud del CP
    // Esto es para el dropdown de ESR
    
    let genero = ["Hombre", "Mujer", "Otro"]
    // El icono i de ESR
    @State private var showingInfo = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 36) {
                Spacer()
                Text("Editar Perfil")
                    .font(.title)
                    .fontWeight(.light)
            }
            
            Spacer(minLength: 18)
            
            VStack(alignment: .leading, spacing: 0){
                // MARK: - Names
                let cp = String(viewModel.editProfileData.postalCode)
                let age = String(viewModel.editProfileData.age)
                
                HStack{
                    VStack(alignment: .leading, spacing: 0) {
                        Text("     Nombre")
                            .bold()
                        TextField(viewModel.editProfileData.firstName, text: $viewModel.editProfileData.firstName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            .disableAutocorrection(true)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("      Apellido")
                            .bold()
                        TextField(viewModel.editProfileData.lastName, text: $viewModel.editProfileData.lastName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            .disableAutocorrection(true)
                    }
                }
                
                Spacer(minLength: 16)
                
                Group {
                    // MARK: - Gender
                    VStack(alignment: .leading, spacing: 0) {
                        Text("     Sexo")
                            .bold()
                        Picker(viewModel.editProfileData.gender, selection: $viewModel.editProfileData.gender) {
                            ForEach(genero, id: \.self) {
                                Text($0)
                            }
                        }
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
                        TextField(String(viewModel.editProfileData.age), text: $viewModel.age)
                            .keyboardType(.numberPad)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                        //.frame(width: 140)
                    }
                    
                    Spacer(minLength: 16)
                    
                    // MARK: - Occupation
                    VStack(alignment: .leading, spacing: 0){
                        Text("     Ocupación")
                            .bold()
                        TextField(viewModel.editProfileData.occupation ?? "", text: Binding(
                            get: { viewModel.editProfileData.occupation ?? "" },
                            set: { viewModel.editProfileData.occupation = $0 })
                        )
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                        
                    }
                    
                    Spacer(minLength: 16)
                    
                    VStack(alignment: .leading, spacing: 0){
                        // MARK: - ZIPCODE
                        Text("      Código Postal")
                            .bold()
                        TextField(String(viewModel.editProfileData.postalCode), text: $viewModel.cp)
                            .keyboardType(.numberPad)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                        
                        Spacer(minLength: 16)
                        
                        // MARK: - Company
                        VStack(alignment: .leading, spacing: 0){
                            Text("     Compañía")
                                .bold()
                            TextField(viewModel.editProfileData.company ?? "", text: Binding(
                                get: { viewModel.editProfileData.company ?? "" },
                                set: { viewModel.editProfileData.company = $0 }
                            ))
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            
                        }
                    }
                    
                    Spacer(minLength: 16)
                }
  
                VStack(alignment: .center) {
                    
                    HStack {
                        Spacer()
                        Button {
                            Task {
                                let response = await viewModel.patchProfile()
                                
                                switch response {
                                    case .success:
                                        break
                                    case .error:
                                        break
                                }
                            }
                        }label: {
                            Text("Actualizar")
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
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getEditProfile()
            }
        }
    }
}

    


struct ProfileDetailViewPreview: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(viewModel: EditProfileViewModel())
    }
}


