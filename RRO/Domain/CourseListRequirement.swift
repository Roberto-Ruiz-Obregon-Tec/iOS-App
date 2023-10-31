//
//  CourseListRequirement.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

protocol CourseListRequirementProtocol {
    func getCourseList(limit: Int, offset: Int) async -> ServerResponse<[Course]>?
    func getCourse(id:String) async -> ServerResponse<[Course]>?
}


class CourseListRequirement: CourseListRequirementProtocol {
    static let shared = CourseListRequirement()
    let dataRepository: CourseRepository

    init(dataRepository: CourseRepository = CourseRepository.shared) {
        self.dataRepository = dataRepository
    }

    func getCourseList(limit: Int, offset: Int) async -> ServerResponse<[Course]>? {
        return await dataRepository.getCourseList(limit: limit, offset: offset)
    }
    
    func getCourse(id:String) async -> ServerResponse<[Course]>? {
        return await dataRepository.getCourse(id: id)
    }
}
