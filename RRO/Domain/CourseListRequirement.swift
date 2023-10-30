//
//  CourseListRequirement.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

protocol CourseListRequirementProtocol {
    func getCourseList(limit: Int, offset: Int) async -> ServerResponse<[Course]>?
}

class CourseListRequirement: CourseListRequirementProtocol {
    let dataRepository: CourseRepository
    static let shared = CourseListRequirement()

    init(dataRepository: CourseRepository = CourseRepository.shared) {
        self.dataRepository = dataRepository
    }

    func getCourseList(limit: Int, offset: Int) async -> ServerResponse<[Course]>? {
        return await dataRepository.getCourseList(limit: limit, offset: offset)
    }
}
