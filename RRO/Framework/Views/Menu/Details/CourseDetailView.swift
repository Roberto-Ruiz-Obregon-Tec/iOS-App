//
//  CourseDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct CourseDetailView: View {
    var course: Course
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

