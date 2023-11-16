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
    @State var admin = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 8){
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
                HStack{
                    Text(program.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    if admin{
                        Button{
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
                VStack(spacing: 8) {
                    Text("Fecha límite para enviar datos:")
                    HStack {
                        Image(systemName: "calendar")
                        
                        Text(program.deadlineDate.toISODate(), format: .dateTime.day().month())
                        
                        Image(systemName: "calendar")
                    }
                }
                .padding(.vertical)
                .font(.title3)
                .fontWeight(.bold)
                
                Spacer()
                
                
                
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
