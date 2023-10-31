//
//  SignupModel.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

struct Signup: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var email: String
    var occupation: String
    var company: String//?
    var sociallyResponsibleCompany: String//?
    var postalCode: Int
    var password: String
    var passwordConfirm: String
    var profilePicture: String//?
    
}

