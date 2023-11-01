//
//  CourseModel.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

struct Course: Codable, Identifiable { // Encoding y decoding | Para identificar celdas
    var id: String
    var name: String
    var description: String
    var speaker: String
    var startDate: Date
    var endDate: Date
    var schedule: String
    var modality: String
    var postalCode: Int?
    var location: String?
    var status: String
    var cost: Int
    var courseImage: String
    var capacity: Int
    var rating: Int
    var meetingCode: String
    var accessCode: String
    var focus: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case name, description, speaker, startDate, endDate, schedule, modality, postalCode, location, status,  cost, courseImage, capacity, rating, meetingCode, accessCode, focus
    }
}

struct CourseResponse<T: Codable>: Codable {
    var status: String
    var results: Int?
    var data: [Course]
}
