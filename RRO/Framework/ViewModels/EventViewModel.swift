//
//  EventViewModel.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

/// A view model responsible for managing and fetching events.
class EventViewModel: ObservableObject {
    /// Published property representing a list of events.
    @Published var eventList = [Event]()
    
    /// Protocol to define the requirements for fetching event lists.
    var eventListRequirement: EventListRequirementProtocol
    
    /// Initializes an instance of `EventViewModel`.
    /// - Parameter eventListRequirement: An object conforming to `EventListRequirementProtocol` that defines the requirements for fetching event lists.
    init(eventListRequirement: EventListRequirementProtocol = EventListRequirement.shared) {
        self.eventListRequirement = eventListRequirement
    }
    
    /// Fetches events asynchronously and updates the `eventList` property.
    @MainActor
    func getEvents() async {
        // Fetch events based on requirements
        if let result = await eventListRequirement.getEventList(limit: 32, offset: 0) {
            self.eventList = result.data ?? self.eventList
        }
    }
}

