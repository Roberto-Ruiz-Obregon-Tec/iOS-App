//
//  PaymentSheetView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct PaymentSheetView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Precio ........ 2 Pso")
                
                NavigationLink {
                    VoucherSheetView()
                } label: {
                    Text("Pagar")
                }.padding()
            }
            
            // Pagar
        }
        
    }
}

#Preview {
    PaymentSheetView()
}
