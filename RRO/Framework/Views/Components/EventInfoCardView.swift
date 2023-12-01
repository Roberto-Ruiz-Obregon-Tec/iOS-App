//
//  EventInfoCardView.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

/// A view representing a card displaying basic information about an event.
struct EventInfoCardView: View {
    /// The event object containing information to be displayed on the card.
    let event: Event
    
    var body: some View {
        NavigationStack {
            VStack {
                // Display event image or default image if not available
                
                WebImage(url: URL(string: event.imageUrl))
                    .placeholder(Image("DefaultImage").resizable())
                    .resizable()
                    .cornerRadius(16)
                    .scaledToFit()
                
                
                // Display event name
                HStack {
                    Text(event.eventName)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                // Display event description
                HStack {
                    Text(event.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    Spacer()
                }.padding(.bottom, 12)
                
                // Display event date
                HStack {
                    Text("Fecha")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(event.startDate!.toISODate(), format: .dateTime.day().month())
                }.padding(.bottom, 2)
                
                Divider()
                
                // Display event location
                HStack {
                    Text("Ubicación")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(event.location)
                }.padding(.bottom, 12)
                
                // Navigation link to view more details
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

/// A preview provider for the `EventInfoCardView`.
struct EventInfoCardPreview: PreviewProvider {
    static var previews: some View {
        EventInfoCardView(event: Event(id: UUID().uuidString, eventName: "Evento", description: "Descripción del evento", location: "Centro de Congresos", startDate: Date.now.toString(), endDate: Date.now.toString(), imageUrl: ""))
    }
}
