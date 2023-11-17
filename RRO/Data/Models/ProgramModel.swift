//
//  ProgramModel.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

// Estructura que representa un programa.
struct Program: Codable, Identifiable {
    var id: String
    var name: String
    var startDate: String
    var endDate: String
    var deadlineDate: String
    var programImage: String
    var postalCode: Int?
    var description: String
    
    // Enumeración que especifica las claves de codificación y decodificación para las propiedades de la estructura.
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, startDate, endDate, deadlineDate, programImage, postalCode, description
    }
}
