//
//  FundationInformationModel.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation


struct InfoFundation: Codable, Identifiable {
    var id: String
    var nombre: String
    var email: String
    var telefono: String
    var descripcion: String
    var ubicacion: String
    var facebook: String
    var twitter: String
    var instagram: String
    var tiktok: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case nombre, email, telefono, descripcion, ubicacion, facebook, twitter, instagram, tiktok
    }
}

struct FoundationResponse<T: Codable>: Codable{
    var status: String
    var results: Int?
    var data: Data
    
    struct Data: Codable {
        var documents: [InfoFundation]
    }
}




