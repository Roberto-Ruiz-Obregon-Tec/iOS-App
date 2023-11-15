//
//  EventDetailView.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct
EventDetailView: View {
    var event: Event
    @State var admin = false
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 8) {
                if event.imageUrl != "" {
                    WebImage(url: URL(string: event.imageUrl))
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
                    Text(event.eventName)
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
                    Text("Fecha(s):")
                    HStack {
                        Image(systemName: "calendar")
                        Text(event.startDate?.toISODate() ?? "10/10/10".toISODate(), format: .dateTime.day().month()) + Text(" - ") + Text(event.endDate?.toISODate() ?? "10/10/10".toISODate(), format: .dateTime.day().month())
                    }
                }
                .padding(.vertical)
                .font(.title3)
                .fontWeight(.bold)
                
                VStack {
                    
                    HStack {
                        Text("Ubicación")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(event.location)
                            .foregroundStyle(.secondary)
                    }
                    
                    Divider()
                                        
                }.padding(.vertical)
                
                VStack(spacing: 8) {
                    HStack {
                        Text("Detalles")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text(event.description)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                }
                
            }.padding(.horizontal)
        }
        .navigationTitle(event.eventName    )
        .navigationBarTitleDisplayMode(.inline)
    }
        
}
