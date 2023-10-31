//
//  CourseInfoCardView.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseInfoCardView: View {
    let course: Course
    
    var body: some View {
        NavigationStack{
            VStack {
                if course.courseImage != "" {
                    WebImage(url: URL(string: course.courseImage))
                        .resizable()
                        .cornerRadius(16)
                        .scaledToFit()
                } else {
                    Image("DefaultImage")
                        .resizable()
                        .cornerRadius(16)
                        .scaledToFit()
                }
                
                HStack {
                    Text(course.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                HStack {
                    Text(course.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                HStack {
                    Text("Fecha")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(course.startDate, format: .dateTime.day().month().year())
                    Text("-")
                    Text(course.endDate, format: .dateTime.day().month().year())
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    Text("Pago")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("$" + String(course.cost))
                }.padding(.bottom, 12)
                
                Divider()
                
                HStack {
                    Text("Modalidad")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(course.modality)
                }.padding(.bottom, 12)
                
                
                NavigationLink {
                    CourseDetailView(course: course)
                } label: {
                    Text("Ver más")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(4)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .foregroundStyle(Color.white)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 1.5)
            )
            .padding(10)
        }
    }
}
#Preview {
    CourseInfoCardView(course: Course(id:UUID().uuidString, name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.",speaker: "", startDate: Date.now, endDate: Date.now, schedule: "", modality: "Presencial", postalCode: 0, location: "", status: "", cost: 1200, courseImage: "", capacity: 1, rating: 0, meetingCode: "", accessCode: "")) // No se especifica el argumento goDetail aquí
}

