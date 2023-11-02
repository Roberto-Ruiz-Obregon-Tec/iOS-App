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


struct CourseDetailViewPreviews: PreviewProvider{
    static var previews: some View{
        CourseDetailView(course: Course(id:UUID().uuidString, name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.",speaker: "", startDate: Date.now.toString(), endDate: Date.now.toString(), schedule: "", modality: "Presencial", postalCode: 0, location: "", status: "", cost: 1200, courseImage: "", capacity: 1, rating: 0, meetingCode: "", accessCode: "", focus: []))
    }
}
