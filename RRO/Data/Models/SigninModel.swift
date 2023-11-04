//
//  SignupModel.swift
//  RRO
//
//  Created by peblo on 30/10/23.
//

import Foundation

struct Signin: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var email: String
    var occupation: String?
    var company: String?
    var sociallyResponsibleCompany: Bool?
    var postalCode: Int
    var password: String
    var passwordConfirm: String
    
}

