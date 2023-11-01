//
//  EventInfoCardView.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventInfoCardView: View {
    let event: Event
    var body: some View {
        NavigationStack{
            VStack {
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
                }.padding(.bottom, 8)
                
                HStack {
                    Text(event.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                HStack {
                    Text("Fecha")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(event.startDate, format: .dateTime.day().month())
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    Text("Ubicación")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(event.location)
                }.padding(.bottom, 12)
                
                NavigationLink {
                    EventDetailView(event: event)
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


struct EventInfoCardPreview: PreviewProvider {
    static var previews: some View {
        EventInfoCardView(event: Event(id:UUID().uuidString, eventName: "Evento", description: "Descripción del evento", location: "Centro de Congresos", startDate: Date.now, endDate: Date.now, imageUrl: ""))
    }
}
