//
//  CourseModel.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

struct Course: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var topics: String
    var teacher: String
    var startDate: Date
    var endDate: Date
    var schedule: String
    var acessLink: String
    var modality: String
    var postalCode: String
    var adress: String
    var status: String
    var bankAccount: String
    var cost: Int
    var imageUrl: String
    var capacity: Int
    var bank: String
    
}
