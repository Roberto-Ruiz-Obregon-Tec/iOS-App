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
                
                HStack {
                    Text(scholarship.description)
                        .foregroundStyle(.secondary)
                        
                    Spacer()
                }
                
                VStack {
                    
                    HStack {
                        Text("Fecha")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        
                        HStack {
                            Text(scholarship.startDate, format: .dateTime.day().month())
                            Text("-")
                            Text(scholarship.endDate, format: .dateTime.day().month())
                            
                        }.foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sector")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(scholarship.sector)
                            .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Lugar")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "location")
                            Text(scholarship.location)
                        }.foregroundStyle(.secondary)
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Organización")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(scholarship.organization)
                            .foregroundStyle(.secondary)
                    }
                }.padding(.vertical)
                
                
                VStack(spacing: 8) {
                    Text("Fecha límite para enviar datos:")
                    HStack {
                        Image(systemName: "calendar")
                        
                        Text(scholarship.endDate, format: .dateTime.day().month())
                        
                        Image(systemName: "calendar")
                    }
                }
                .padding(.vertical)
                .font(.title3)
                .fontWeight(.bold)

                
                VStack(spacing: 8) {
                    Text("Comunícate con nosotros para más información")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        Text("roberobregon@gmail.com")
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "phone")
                            Text("4425014996")
                        }
                    }
                    .padding(.horizontal)
                    .font(.subheadline)
                    
                }.padding(.vertical)
            }
            .padding(.horizontal)
        }
        .navigationTitle(scholarship.name)
        .navigationBarTitleDisplayMode(.inline)
    }
        
}

#Preview {
    ScholarshipDetailView(scholarship: Scholarship(
        id: "",
        name: "",
        description: "",
        organization: "",
        location: "",
        email: "",
        phone: "",
        image: "",
        sector: "",
        startDate: Date.now,
        endDate: Date.now))
}
