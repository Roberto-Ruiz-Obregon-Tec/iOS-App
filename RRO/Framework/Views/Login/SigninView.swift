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
        Text("Regístrate")
            .font(.title)
        Button {
            goMenu()
        } label: {
            Text("Crear usuario")
        }
        
        
        
    }
}

#Preview {
    SigninView{()}

}
