//
//  ProgramDetailView.swift
//  RRO
//
//  Created by KARLA PADILLA on 30/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProgramDetailView: View {
    var program: Program
    @State var admin = false // Estado para controlar si el usuario es un administrador
    
    var body: some View {
        ScrollView{
            VStack(spacing: 8){
                // Mostrar la imagen del programa desde la URL proporcionada o una imagen predeterminada si no hay URL
                
                WebImage(url: URL(string: program.programImage))
                    .placeholder(Image("DefaultImage").resizable())
                    .resizable()
                    .cornerRadius(16)
                    .scaledToFit()
                    .padding(.top)
                
                // Mostrar el nombre del programa y un botón de edición si el usuario es un administrador

                HStack{
                    Text(program.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    if admin{
                        Button{
                            // Acción para editar el programa
                            // Aquí deberías implementar la lógica de edición del programa
                        } label:{
                            Image(systemName: "pencil")
                            Text("Editar")
                        }
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(.infinity)
                        .foregroundStyle(.white)
                    }
                }
                
                Spacer()
                
                VStack {
                    // Mostrar información detallada del programa como duración y código postal
                    HStack {
                        Text("Duración")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        
                        HStack {
                            Text(program.startDate.toISODate(), format: .dateTime.day().month())
                            Text("-")
                            Text(program.endDate.toISODate(), format: .dateTime.day().month())
                            
                        }.foregroundStyle(.secondary)
                    }
                    
                    
                    Divider()
                    
                    HStack {
                        Text("Codigo postal")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "location")
                            Text(String(program.postalCode!))
                        }.foregroundStyle(.secondary)
                        
                    }
                                        
                }.padding(.vertical)
                
                // Mostrar la descripción del programa
                VStack(spacing: 8) {
                    HStack {
                        Text("Descripción")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text(program.description)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                }
                
            }.padding(.horizontal)
        }
        .navigationTitle(program.name)
        .navigationBarTitleDisplayMode(.inline)
            }
        }

struct ProgramDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        ProgramDetailView(program: Program(id: UUID().uuidString, name: "Prueba", startDate: Date.now.toString(), endDate: Date.now.toString(), deadlineDate: Date.now.toString(), programImage: "", postalCode: 1234, description: "Ejemplo"))
    }
    
    
}
