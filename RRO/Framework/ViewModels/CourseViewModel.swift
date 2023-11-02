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
        let result = await courseListRequirement.getCourseList()
        
        if let res = result {
            self.courseList = res.data ?? self.courseList
            print("ModelView: Received course data")
        } else {
            print("Failed to fetch course data")
        }
    }

}

