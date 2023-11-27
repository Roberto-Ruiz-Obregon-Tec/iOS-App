//
//  InfoCardView.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

// Define una vista en SwiftUI llamada ProgramInfoCardView que muestra información sobre un programa.
struct ProgramInfoCardView: View {
    let program: Program // La información del programa se pasa como un parámetro a la vista.
    var body: some View {
        NavigationStack {
            VStack {
                // Muestra la imagen del programa si está disponible, de lo contrario, muestra una imagen predeterminada.
                if program.programImage != "" {
                    WebImage(url: URL(string: program.programImage))
                        .resizable()
                        .cornerRadius(16)
                        .scaledToFit()
                } else {
                    Image("DefaultImage")
                        .resizable()
                        .cornerRadius(16)
                        .scaledToFit()
                }
                // Muestra el nombre del programa en un tamaño de fuente grande y negrita.
                HStack {
                    Text(program.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                // Muestra la descripción del programa con un estilo de texto secundario y un peso de fuente medio.
                HStack {
                    Text(program.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                // Muestra la fecha límite del programa en un formato personalizado.
                HStack {
                    Text("Fecha límite")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(program.deadlineDate.toISODate(), format: .dateTime.day().month())
                }.padding(.bottom, 2)
                
                Divider()                 // Muestra una línea divisoria.
                
                // Muestra la categoría del programa (actualmente comentada en el código original).
                HStack {
                    Text("Categoría")
                        .foregroundStyle(.secondary)
                    Spacer()
                    //Text(program.category)
                }.padding(.bottom, 12)
                
                // Navegación a la vista detallada del programa.
                NavigationLink {
                    ProgramDetailView(program: program)
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

// Vista de previsualización para la vista ProgramInfoCardView.
struct ProgramInfoCardView_Preview: PreviewProvider {
    static var previews: some View {
        // Crea una instancia de ProgramInfoCardView para la previsualización.
        ProgramInfoCardView(program: Program(id: UUID().uuidString, name: "Programa", startDate: Date.now.toString(), endDate: Date.now.toString(), deadlineDate: Date.now.toString(), programImage: "", postalCode: 123, description: "Este programa es muy bueno, deberías de inscribirte y probarlo."))
    }
}
