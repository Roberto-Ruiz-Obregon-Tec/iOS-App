//
//  RestoreView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct RestoreView: View {
    let goLogin: () -> Void
    var body: some View {
        Text("Restore")
        Button {
            goLogin()
        } label: {
            Text("Crear nueva contraseña")
        }
    }
}
