//
//  PublicationModel.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

struct Publication : Codable, Identifiable {
    var id : String
    var title: String
    var description: String
    var likes : Int
    var image : String
    var updatedAt : String
    var createdAt : String
    var comments : [String]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case title, description, likes, image, updatedAt, createdAt, comments
    }
}

struct PublicationResponse <T : Codable>: Codable {
    var status : String
    var results : String
    var data : [Publication]
}
