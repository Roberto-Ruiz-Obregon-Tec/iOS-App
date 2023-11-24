//
//  LoginModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 25/10/23.
//

import Foundation

struct User: Codable {
    var id: String
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var email: String
    var occupation: String?
    var company: String?
    var sociallyResponsibleCompany: Bool?
    var postalCode: Int
}

struct Login: Codable {
    var email: String
    var password: String
}
