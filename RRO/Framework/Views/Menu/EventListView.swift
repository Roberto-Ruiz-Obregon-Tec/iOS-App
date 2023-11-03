//
//  EventListView.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import SwiftUI

struct EventListView: View {
    @StateObject var eventViewModel = EventViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(eventViewModel.eventList) {event in
                    EventInfoCardView(event: event)
                }
                
            }
            .padding(.horizontal)
            .onAppear {
                Task {
                    await eventViewModel.getEvents()
                }
            }
        }
    }
}

struct EventListViewPreviews: PreviewProvider {
    static var previews: some View {
        EventListView (eventViewModel: getViewModel())
    }
    
    static var elems = 10
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
