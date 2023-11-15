//
//  CompanyModel.swift
//  RRO
//
//  Created by Erik Cabrera on 07/11/23.
//

import Foundation

struct Company: Codable, Identifiable {
    var id: String
    var postalCode: String
    var name: String
    var description: String
    var phone: String
    var certifications: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case postalCode, name, description, phone, certifications
    }

}

struct CompanyResponse<T: Codable>: Codable {
    var status: String
    var results: Int?
    var data: Data
    
    struct Data: Codable {
        var companies: [Company]
    }
}
