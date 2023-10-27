//
//  API.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

struct API {
    // TODO: Change the url with the deployed domain, private ip used for testing
        //IP DEL PAXI
    static let base = "http://169.254.56.31:3000/v1"
    
    struct routes {
        // TODO: Map all the routes
        static let userSignup = "/user/auth/signup"
        static let userLogin = "/user/auth/login"
        static let adminSignup = "/admin/auth/signup"
        static let adminLogin = "/admin/auth/login"
        
        static let course = "/course"
        static let scholarship = "/scholarship"
    }
}

protocol LoginAPIProtocol {
    // En mi login, solo quiero que me regrese mi ID
    func postLogin(model: User) async -> Result<String,Error>
}

protocol ScholarshipAPIProtocol {
    // https://{API_DOMAIN}/v1/scholarship?limit={Int}&offset={Int}
    func getScholarshipList(limit: Int, offset: Int) async -> [Scholarship]?
    // https://{API_DOMAIN}/v1/scholarship/{id}
    func getScholarship(id: String) async -> Scholarship?
}

