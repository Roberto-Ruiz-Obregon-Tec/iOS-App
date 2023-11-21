//
//  ScolarshipDetailView.swift
//  RRO
//
//  Created by peblo on 23/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ScholarshipDetailView: View {
    var scholarship: Scholarship
    @State var admin = false
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 8) {
                if scholarship.image != "" {
                    WebImage(url: URL(string: scholarship.image))
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
                    Text(scholarship.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    if admin {
                        Button {
                            // TODO: Give the admin access to edit the field
                        } label: {
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
                        
                        Text(scholarship.endDate.toISODate(), format: .dateTime.day().month())
                        
                        Image(systemName: "calendar")
                    }
                }
                .padding(.vertical)
                .font(.title3)
                .fontWeight(.bold)
           
                VStack {
                    Group {
                        HStack {
                            Text("Organización")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(scholarship.organization)
                                .foregroundStyle(.secondary)
                        }
                        
                        Divider()
                    }
                    
                    Group{
                        HStack {
                            Text("Email")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(scholarship.email)
                                .foregroundStyle(.secondary)
                        }
                        
                        Divider()
                    }
                    
                    Group {
                        HStack {
                            Text("Teléfono")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "phone")
                                Text(scholarship.phone)
                            }.foregroundStyle(.secondary)
                        }
                        
                        Divider()
                    }
                    
                    Group {
                        HStack {
                            Text("Periodo de aplicación")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            
                            HStack {
                                Text(scholarship.startDate.toISODate(), format: .dateTime.day().month())
                                Text("-")
                                Text(scholarship.endDate.toISODate(), format: .dateTime.day().month())
                                
                            }.foregroundStyle(.secondary)
                        }
                        
                        Divider()
                    }
                    Group {
                        HStack {
                            Text("Sector")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(scholarship.sector)
                                .foregroundStyle(.secondary)
                        }
                        
                        Divider()
                    }
                    
                    HStack {
                        Text("Lugar")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "location")
                            Text(scholarship.location)
                        }.foregroundStyle(.secondary)
                        
                    }
                                        
                }.padding(.vertical)
                
                VStack(spacing: 8) {
                    HStack {
                        Text("Detalles")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text(scholarship.description)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                }
                
            }.padding(.horizontal)
        }
        .navigationTitle(scholarship.name)
        .navigationBarTitleDisplayMode(.inline)
    }
        
}


struct ScholarshipDetailViewPreview: PreviewProvider {
    static var previews: some View {
        ScholarshipDetailView(scholarship: Scholarship(
            id: UUID().uuidString,
            name: "Beca",
            description: "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Facilis laborum voluptates fugit officia, ad obcaecati qui nihil nulla maiores. Repudiandae dolor consequatur praesentium eaque ipsa incidunt sed molestiae numquam, ratione nesciunt aliquid?",
            organization: "JANN",
            location: "N/A",
            email: "john.doe@gmail.com",
            phone: "442123456",
            image: "",
            sector: "Primaria",
            startDate: Date.now.toString(),
            endDate: Date.now.toString()
        ))
    }
}

