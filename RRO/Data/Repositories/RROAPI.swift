//
//  API.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

struct API {
    // TODO: Change the url with the deployed domain, private ip used for testing
            //                 |
                //PONER TU IP AQUÍ v
    static let base = "http://10.25.107.225:3001/v1"
    
    struct routes {
        // TODO: Map all the routes
        static let userSignup = "/user/auth/signup"
        static let userLogin = "/user/auth/login"
        static let adminSignup = "/admin/auth/signup"
        static let adminLogin = "/admin/auth/login"
        
        static let certification = "/certifications"
        static let course = "/course"
        static let scholarship = "/scholarship"
        static let program = "/program"
        static let event = "/event"
        static let infoFundation = "/informacion-fundacion"
    }
}

protocol LoginAPIProtocol {
    // En mi login, solo quiero que me regrese mi ID
    func postLogin(model: Login) async -> ServerResponse<User>?
}

protocol SignUpAPIProtocol {
    func postSignup(model: Signup) async -> ServerResponse<User>?
}

protocol ScholarshipAPIProtocol {
    // https://{API_DOMAIN}/v1/scholarship?limit={Int}&offset={Int}
    func getScholarshipList(limit: Int, offset: Int) async -> [Scholarship]?
    // https://{API_DOMAIN}/v1/scholarship/{id}
    func getScholarship(id: String) async -> Scholarship?
}

protocol ProgramAPIProtocol {
    // https://{API_DOMAIN}/v1/program?limit={Int}&offset={Int}
    func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>?
    // https://{API_DOMAIN}/v1/program/{id}
    func getProgram(id: String) async -> Program?
}


protocol CourseAPIProtocol {
    // https://{API_DOMAIN}/v1/course?params=val
    func getCourseList() async -> ServerResponse<[Course]>?
    // https://{API_DOMAIN}/v1/course/{id}
    func getCourse(id: String) async -> ServerResponse<[Course]>?
}

protocol EventAPIProtocol {
    // https://{API_DOMAIN}/v1/event?limit={Int}&offset={Int}
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<[Event]>?
    // https://{API_DOMAIN}/v1/event/{id}
   // func getEvent(id: String) async -> Event?
}

//FAQ VIEW PROTOCOL
protocol FundationInformationAPIProtocol{
    // https://{API_DOMAIN}/v1/informacion-fundacion
    func getInfoFundation(limit : Int) async -> ServerResponse<[InfoFundation]>?
}
    
protocol CertificationAPIProtocol {
    // https://{API_DOMAIN}/v1/certification?limit={Int}&offset={Int}
    func getCertificationList(limit: Int) async -> ServerResponse<[Certification]>?
}

