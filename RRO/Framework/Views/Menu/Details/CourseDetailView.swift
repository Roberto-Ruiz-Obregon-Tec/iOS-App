//
//  CourseDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct CourseDetailView: View {
    var body: some View {
        NavigationStack {
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

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
