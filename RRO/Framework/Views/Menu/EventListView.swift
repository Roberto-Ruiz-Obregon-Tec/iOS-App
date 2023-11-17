//
//  EventListView.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import SwiftUI

/// A view displaying a list of events using EventInfoCardView.
struct EventListView: View {
    /// EventViewModel responsible for fetching and managing events.
    @StateObject var eventViewModel = EventViewModel()
    
    var body: some View {
        VStack {
            // Display a message if there are no events available
            if eventViewModel.eventList.isEmpty {
                Text("No hay eventos disponibles en este momento")
                    .padding()
            } else {
                ScrollView {
                    // Display a card for each event in the event list
                    ForEach(eventViewModel.eventList) { event in
                        EventInfoCardView(event: event)
                    }
                }
            }
        }
        .onAppear {
            // Fetch events when the view appears
            Task {
                await eventViewModel.getEvents()
            }
        }
    }
}

/// A preview provider for the `EventListView`.
struct EventListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EventListView(eventViewModel: getViewModel())
        }
    }
    
    static var elems = 10
    
    /// Creates a sample EventViewModel with a list of dummy events.
    static func getViewModel() -> EventViewModel {
        let vm = EventViewModel()
        for _ in 1...elems {
            vm.eventList.append(
                Event(id: UUID().uuidString, eventName: "Evento", description: "Descripción del evento", location: "Centro de Congresos", startDate: Date.now.toString(), endDate: Date.now.toString(), imageUrl: "")
            )
        }
        return vm
    }
}

