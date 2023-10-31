//
//  CourseViewModel.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

class CourseViewModel: ObservableObject {
    @Published var courseList = [Course]()
    
    var courseListRequirement: CourseListRequirementProtocol
    
    init(courseListRequirement: CourseListRequirementProtocol = CourseListRequirement.shared) {
        self.courseListRequirement = courseListRequirement
    }
    
    @MainActor
    func getCourseList() async {
        let result = await courseListRequirement.getCourseList(limit: 32, offset: 0)
        if let res = result {
            self.courseList = res.data ?? []
            print("Received course data: \(self.courseList)")
        } else {
            print("Failed to fetch course data")
        }
    }

}

