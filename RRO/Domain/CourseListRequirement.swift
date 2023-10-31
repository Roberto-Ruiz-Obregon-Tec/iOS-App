//
//  CourseListRequirement.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

protocol CourseListRequirementProtocol {
    func getCourseList() async -> ServerResponse<[Course]>?
}


class CourseListRequirement: CourseListRequirementProtocol {
    static let shared = CourseListRequirement()
    let dataRepository: CourseRepository

    init(dataRepository: CourseRepository = CourseRepository.shared) { //Singleton
        self.dataRepository = dataRepository
    }

    func getCourseList() async -> ServerResponse<[Course]>? {
        return await dataRepository.getCourseList()
    }
}
