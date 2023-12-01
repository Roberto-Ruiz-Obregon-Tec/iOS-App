//
//  PublicationModel.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

struct Publication : Codable, Identifiable { // Encoding y decoding | Para identificar celdas
    var id : String
    var title: String
    var description: String
    var likes : Int
    var image : String
    var updatedAt : String
    var createdAt : String
    var liked : Bool
    var comments : [Comments]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case title, description, likes, image, updatedAt, createdAt, liked, comments
    }
}

struct Comments : Codable {
    var comment: String
    var user : String
}

struct PublicationResponse <T : Codable>: Codable {
    var status : String
    var results : String
    var data : [Publication]
}

struct PublicationPostResponse : Codable{
    var status : String
}
