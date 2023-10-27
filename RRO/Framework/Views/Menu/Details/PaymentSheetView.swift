//
//  PaymentSheetView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct PaymentSheetView: View {
    //@Environment(\.dismiss) var dismiss
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

struct PaymentSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSheetView()
    }
}
