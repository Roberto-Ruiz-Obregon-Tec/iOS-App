//
//  CourseInfoCardView.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

// Vista que muestra la información de un curso en una tarjeta
struct CourseInfoCardView: View {
    let course: Course
    
    var body: some View {
        // Utiliza NavigationStack para permitir la navegación
        NavigationStack {
            VStack {
                // Muestra una imagen del curso si está disponible, de lo contrario, muestra una imagen por defecto
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
                    // Muestra el nombre del curso en negrita
                    Text(course.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                HStack {
                    // Muestra la descripción del curso en estilo secundario
                    Text(course.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                HStack {
                    // Muestra la fecha de inicio y finalización del curso en formato personalizado
                    Text("Fecha")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(course.startDate!.toISODate(), format: .dateTime.day().month().year())
                    Text("-")
                    Text(course.endDate!.toISODate(), format: .dateTime.day().month().year())
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    // Muestra el costo del curso
                    Text("Pago")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("$" + String(course.cost))
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    // Muestra la modalidad del curso
                    Text("Modalidad")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(course.modality)
                }.padding(.bottom, 12)
                
                // Permite la navegación a la vista de detalles del curso al tocar el botón "Ver más"
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

