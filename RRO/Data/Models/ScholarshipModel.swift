//
//  ScholarshipModel.swift
//  RRO
//
//  Created by peblo on 24/10/23.
//

import Foundation

struct Scholarship: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var organization: String
    var location: String
    var email: String
    var phone: String
    var image: String
    var sector: String
    var startDate: String
    var endDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Maps the property 'id' to '_id' in the JSON
        case name, description, organization, location, email, phone, image, sector, startDate, endDate
    }

}

/// A generic model representing the response structure for scholarships.
struct ScholarshipResponse<T: Codable>: Codable {
    var status: String
    var results: Int?
    var data: ScholarshipData
}

/// A nested struct representing the data section of the response.
struct ScholarshipData: Codable {
    var documents: [Scholarship]
}
