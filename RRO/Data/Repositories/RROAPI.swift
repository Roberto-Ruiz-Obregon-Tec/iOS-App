//
//  API.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

struct API {
    // TODO: Change the url with tohe deployed domain, private ip used for testing
            //                 |
                //PONER TU IP AQUÍ v
    static let base = "https://us-central1-roberto-ruiz-obregon.cloudfunctions.net/test/v1"
    
    
    struct routes {
        // TODO: Map all the routes
        static let userSignup = "/user/auth/signup"
        static let userLogin = "/user/auth/login"
        static let userLogout = "/user/auth/logout"
        static let adminSignup = "/admin/auth/signup"
        static let adminLogin = "/admin/auth/login"
        static let userInfo = "/user/auth/me"
        static let updateme = "/user/auth/updateme"
        
        static let certification = "/certifications"
        static let course = "/course"
        static let scholarship = "/scholarships"
        static let program = "/program"
        static let event = "/event"
        static let infoFundation = "/informacion-fundacion"
        static let myCourses = "/user/mycourses"
        static let courseRating = "/course/updateRating"
        static let createCourseComment = "/course/comment/create"
        static let company = "/company-certifications"
        static let publication = "/publication"
        static let likePublication = "/publication/like"
        static let createPublicationComment = "/publication/comment/create"
        static let inscribeToCourse = "/inscription/create"
    }
}

protocol LoginAPIProtocol {
    // En mi login, solo quiero que me regrese mi token
    func postLogin(model: Login) async -> ServerResponse<User>?
}

protocol SigninAPIProtocol {
    func postSignin(model: Signin) async -> ServerResponse<User>?
}

protocol LogoutAPIProtocol{
    // https://{API_DOMAIN}/v1/user/auth/logout
    func getLogout() async -> ServerResponse<User>?
}

protocol EditProfileAPIProtocol{
    func getEditProfile() async -> ServerResponse<User>?
    func patchProfile(model: User) async -> ServerResponse<User>?
}

protocol ScholarshipAPIProtocol {
    // https://{API_DOMAIN}/v1/scholarship?limit={Int}&offset={Int}
    func getScholarshipList(limit: Int, offset: Int) async -> ServerResponse<ScholarshipData>?
    // https://{API_DOMAIN}/v1/scholarship/{id}
    func getScholarship(id: String) async -> ServerResponse<Scholarship>?
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
    // https://{API_DOMAIN}/v1/user/mycourses/
    func getMyCourses() async -> ServerResponse<[Course]>?
    // https://{API_DOMAIN}/v1/course/updateRating
    func updateCourseRating(model: Rating) async -> ServerResponse<[Course]>?
    // https://{API_DOMAIN}/v1/course/comment/create
    func createCourseComment(courseId: String, comment: String) async -> ServerResponse<Course>?
    // https://{API_DOMAIN}/v1/course/inscription/create
    func createCourseInscription(courseId: String, voucher: String?) async -> ServerResponse<String>?
}

protocol EventAPIProtocol {
    // https://{API_DOMAIN}/v1/event?limit={Int}&offset={Int}
    func getEventList(limit: Int, offset: Int) async -> ServerResponse<EventData>?
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

protocol CompanyAPIProtocol {
    // https://{API_DOMAIN}/v1/company-certfications
    func getCompanyList(limit: Int, offset: Int) async -> ServerResponse<[Company]>?
}

protocol PublicationAPIProtocol {
    //https://{API_DOMAIN}/v1/publication
    func getPublicationList() async -> ServerResponse<[Publication]>?
    func getPublicationInfo(publicationId : String) async -> ServerResponse<[Publication]>?
    func like(publicationId : String) async -> ServerResponse<PublicationPostResponse>?
    func createPublicationComment(publicationId : String, comment : String) async -> ServerResponse<PublicationPostResponse>?
}
