//
//  ProgramModel.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

struct Program: Codable, Identifiable {
    var id: String
    var name: String
    var startDate: Date
    var endDate: Date
    var deadlineDate: Date
    var programImage: String
    var postalCode: Int
    var description: String
}
