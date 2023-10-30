//
//  CourseInfoCardView.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseInfoCardView: View {
    var name: String
    var description: String
    var startDate: Date
    var endDate: Date
    var modality: String
    var cost: Int
    var imageUrl: String
    let goDetail: () -> Void
    
    var body: some View {
        VStack {
            if imageUrl != "" {
                WebImage(url: URL(string: imageUrl))
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
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.bottom, 8)
            
            HStack {
                Text(description)
                    .foregroundStyle(.secondary)
                    .fontWeight(.medium)
                
                Spacer()
            }.padding(.bottom, 12)
            
            HStack {
                Text("Fecha")
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text(startDate, format: .dateTime.day().month().year())
                Text("-")
                Text(endDate, format: .dateTime.day().month().year())
            }.padding(.bottom, 2)
            
            Divider()
            
            HStack {
                Text("Pago")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("$" + String(cost))
            }.padding(.bottom, 12)
            
            Divider()
            
            HStack {
                Text("Modalidad")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(modality)
            }.padding(.bottom, 12)
            
            
            Button {
                goDetail()
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

#Preview {
    CourseInfoCardView(name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.", startDate: Date.now, endDate: Date.now, modality: "Presencial", cost: 1200, imageUrl: "", goDetail: {}) // No se especifica el argumento goDetail aquí
}

