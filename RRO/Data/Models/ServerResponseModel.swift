//
//  ServerResponse.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

struct ServerResponse<T: Codable>: Codable {
    var status: String
    var results: Int?
    var data: Data
    
    struct Data: Codable {
        var document: T?
        var documents: [T]?
    }
}
