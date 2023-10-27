//
//  CourseDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct CourseDetailView: View {
    @State var showingPaymentSheet = false
    var body: some View {
        VStack {
            Text("Detalle del curso info y eso")
            
            Button {
                showingPaymentSheet.toggle()
            } label: {
                Text("Inscribirme")
            }
            .sheet(isPresented: $showingPaymentSheet, content: {
                PaymentSheetView()
            })
            .padding()
            
        }
        
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
