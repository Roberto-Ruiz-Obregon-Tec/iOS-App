//
//  ScholarshipModel.swift
//  RRO
//
//  Created by peblo on 24/10/23.
//

import Foundation

struct Scholarship: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var organization: String
    var location: String
    var email: String
    var phone: String
    var image: String
    var sector: String
    var startDate: String
    var endDate: String

}
