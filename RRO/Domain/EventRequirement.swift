//
//  EventRequirement.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

/// A protocol defining the requirements for fetching a list of events.
protocol EventListRequirementProtocol {
    /// Asynchronously fetches a list of events based on specified limits and offsets.
    /// - Parameters:
    ///   - limit: The maximum number of events to fetch.
    ///   - offset: The offset to start fetching events from.
    /// - Returns: A `ServerResponse` containing an array of events or `nil` if the fetch is unsuccessful.
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<EventData>?
}

/// A concrete implementation of `EventListRequirementProtocol`.
class EventListRequirement: EventListRequirementProtocol {
    /// Data repository responsible for interacting with event data.
    let dataRepository: EventRepository
    
    /// A shared instance of `EventListRequirement`.
    static let shared = EventListRequirement()

    /// Initializes an instance of `EventListRequirement`.
    /// - Parameter dataRepository: The data repository responsible for interacting with event data.
    init(dataRepository: EventRepository = EventRepository.shared) {
        self.dataRepository = dataRepository
    }

    /// Asynchronously fetches a list of events based on specified limits and offsets.
    /// - Parameters:
    ///   - limit: The maximum number of events to fetch.
    ///   - offset: The offset to start fetching events from.
    /// - Returns: A `ServerResponse` containing an array of events or `nil` if the fetch is unsuccessful.
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<EventData>? {
        return await dataRepository.getEventList(limit: limit, offset: offset)
    }
}

