//
//  CourseDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct CourseDetailView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Detalle del curso info y eso")
                
                NavigationLink {
                    PaymentSheetView()
                } label: {
                    Text("Inscribirme")
                }.padding()
                
            }
        }
        
    }
}

#Preview {
    CourseDetailView()
}
