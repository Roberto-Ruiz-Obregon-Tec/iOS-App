//
//  EventModel.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

struct Event: Codable, Identifiable {
    var id: String
    var eventName: String
    var description: String
    var location: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case eventName, description, location, startDate, endDate, imageUrl
    }

}

struct EventResponse<T: Codable>: Codable {
    var status: String
    var results: Int?
    var data: Data
    
    struct Data: Codable {
        var documents: [Event]
    }
}
