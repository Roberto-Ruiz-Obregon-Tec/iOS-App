//
//  ProfileView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct ProfileView: View {
    let goLogin: () -> Void
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "person")
                        .font(.largeTitle)
                    
                    Text("Perfil")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                NavigationLink {
                    ProfileDetailView()
                } label: {
                    Text("Editar perfil")
                        .padding()
                }
                
                Button {
                    // TODO: Log out user
                    goLogin()
                    
                } label: {
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

#Preview {
    ProfileView{()}
}
