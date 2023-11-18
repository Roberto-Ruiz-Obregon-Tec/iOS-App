//
//  CertificationModel.swift
//  RRO
//
//  Created by Sebastian Jimenez Bauer on 30/10/23.
//

import Foundation

/// Defines a  data model (Certification) for certifications in the "RRO" app.
struct Certification: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var adquisitionDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Maps the property 'id' to '_id' in the JSON
        case name, description, adquisitionDate // Update key names to match JSON keys
    }
}
