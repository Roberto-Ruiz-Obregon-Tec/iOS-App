//
//  LoginModel.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 25/10/23.
//

import Foundation

// Model of the User, here it's defined the variables and it's type of value
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
    var profilePicture: String?
}

// Model of the Login, here it's defined the variables and it's type of value
struct Login: Codable {
    var email: String
    var password: String
}
