//
//  EventRepository.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

/// A repository responsible for interacting with event data and implementing the EventAPIProtocol.
class EventRepository: EventAPIProtocol {
    /// Network service for making API requests.
    let netService: NetworkAPIService
    
    /// A shared instance of `EventRepository`.
    static let shared = EventRepository()
    
    /// Initializes an instance of `EventRepository`.
    /// - Parameter netService: The network service for making API requests.
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    /// Fetches a list of events from the server asynchronously.
    /// - Parameters:
    ///   - limit: The maximum number of events to fetch.
    ///   - offset: The offset to start fetching events from.
    /// - Returns: A `ServerResponse` containing an array of events or `nil` if the fetch is unsuccessful.
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<[Event]>? {
        let params = [
            "limit": limit,
            "offset": offset
        ]
        
        // Use the network service to make a GET request to the event API endpoint
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.event)")!, params: params)
    }
}

