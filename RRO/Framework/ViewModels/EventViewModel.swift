//
//  EventViewModel.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var eventList = [Event]()
    
    var eventListRequirement: EventListRequirementProtocol
    
    init(eventListRequirement: EventListRequirementProtocol = EventListRequirement.shared) {
        self.eventListRequirement = eventListRequirement
    }
    
    @MainActor
    func getEvents() async {
        let result = await eventListRequirement.getEventList(limit: 32, offset: 0)
        if let res = result {
            self.eventList = res.data ?? []
        }
        
    }
}
