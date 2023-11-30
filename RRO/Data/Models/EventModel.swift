//
//  EventModel.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

/// A model representing an event.
struct Event: Codable, Identifiable {
    var id: String
    var eventName: String
    var description: String
    var location: String
    var startDate: String?
    var endDate: String?
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Maps the property 'id' to '_id' in the JSON
        case eventName, description, location, startDate, endDate, imageUrl
    }
}

/// A generic model representing the response structure for events.
struct EventResponse<T: Codable>: Codable {
    var status: String
    var results: Int?
    var data: Data
}

/// A nested struct representing the data section of the response.
struct EventData: Codable {
    var documents: [Event]
}

