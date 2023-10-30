//
//  EventModel.swift
//  RRO
//
//  Created by Azul Rosales on 30/10/23.
//

import Foundation

struct Event: Codable, Identifiable {
    var id: String
    var name: String
    var startDate: Date
    var endDate: Date
    var eventImage: String
    var location: String
    var description: String
}
