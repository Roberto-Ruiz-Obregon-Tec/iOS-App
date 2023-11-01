//
//  ProfileDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct ProfileDetailView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .font(.largeTitle)
                
                Text("Perfil")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            
            Text("Cosas para editar el perfil")
            
        
        }
    }
}

struct ProfileDetailViewPreview: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
