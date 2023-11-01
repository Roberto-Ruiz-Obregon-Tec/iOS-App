//
//  SigninView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct SigninView: View {
    let goMenu: () -> Void
    
    var body: some View {
        
        VStack {
            
            Text("Regístrate")
                .font(.title)
            Button {
                goMenu()
            } label: {
                Text("Crear usuario")
            }
            
        }
        
    }
}


struct SigninViewPreview: PreviewProvider {
    static var previews: some View {
        SigninView{()}
    }
}

