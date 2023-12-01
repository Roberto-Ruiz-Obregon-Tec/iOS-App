//
//  CourseListRequirement.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

protocol CourseInfoRequirementProtocol {
    func getCourse(id:String) async -> ServerResponse<[Course]>?
    
    func createCourseInscription(courseId: String, voucher: String?) async -> ServerResponse<String>?
}


class CourseInfoRequirement: CourseInfoRequirementProtocol {
    static let shared = CourseInfoRequirement()
    let dataRepository: CourseRepository

    init(dataRepository: CourseRepository = CourseRepository.shared) { //Singleton
        self.dataRepository = dataRepository
    }
    
    func getCourse(id:String) async -> ServerResponse<[Course]>? {
        return await dataRepository.getCourse(id: id)
    }
    
    func createCourseInscription(courseId: String, voucher: String?) async -> ServerResponse<String>? {
        return await dataRepository.createCourseInscription(courseId: courseId, voucher: voucher)
    }
}
