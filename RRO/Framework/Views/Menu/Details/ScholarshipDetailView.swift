//
//  ScolarshipDetailView.swift
//  RRO
//
//  Created by peblo on 23/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ScholarshipDetailView: View {
    // TODO: change state to use view model
    @State var scolarshipName = "Alimentos"
    @State var description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    @State var startDate = Date.now
    @State var endDate = Date.now.addingTimeInterval(86400)
    @State var sector = "Primaria"
    @State var location = "Queretaro" // TODO: Hook up google maps
    @State var organization = "FFK"
    @State var admin = false
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 8) {
                WebImage(url: URL(string: "https://www.eclosio.ong/wp-content/uploads/2018/08/default.png"))
                    .resizable()
                    .cornerRadius(16)
                    .scaledToFit()
                
                HStack {
                    Text(scolarshipName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    //if admin {
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
                    //}
                }
                
                Text(description)
                    .foregroundStyle(.secondary)
                
                VStack {
                    
                    HStack {
                        Text("Fecha")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack {
                            Text(startDate, format: .dateTime.day().month())
                            Text("-")
                            Text(endDate, format: .dateTime.day().month())
                        }.foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Sector")
                        
                        Spacer()
                        
                        Text(sector)
                            .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Lugar")
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "location")
                            Text(location)
                        }.foregroundStyle(.secondary)
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Organización")
                        
                        Spacer()
                        
                        Text(organization)
                            .foregroundStyle(.secondary)
                    }
                }.padding(.vertical)
                
                
                VStack(spacing: 8) {
                    Text("Fecha límite para enviar datos:")
                    HStack {
                        Image(systemName: "calendar")
                        Text(endDate, format: .dateTime.day().month())
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
        .navigationTitle(scolarshipName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ScholarshipDetailView()
}
