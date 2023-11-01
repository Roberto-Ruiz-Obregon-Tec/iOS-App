//
//  EventDetailView.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EventDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event(id: UUID().uuidString, eventName: "Evento", description: "Descripción del evento", location: "Centro de Congresos", startDate: Date.now, endDate: Date.now, imageUrl: ""))
    }
}
