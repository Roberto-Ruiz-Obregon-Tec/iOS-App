//
//  FundationInformationModel.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation

/// Defines a  data model (InfoFundation) for foundation information in the "RRO" app.
struct InfoFundation: Codable, Identifiable {
    var id: String
    var name: String
    var email: String
    var phone: String
    var description: String
    var location: String
    var facebook: String
    var twitter: String
    var instagram: String
    var tiktok: String
    
   /* enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case nombre, email, telefono, descripcion, ubicacion, facebook, twitter, instagram, tiktok
    }*/
}

struct FoundationResponse<T: Codable>: Codable{
    var status: String
    var results: Int?
    var data: Data
    
    struct Data: Codable {
        var documents: [InfoFundation]
    }
}




