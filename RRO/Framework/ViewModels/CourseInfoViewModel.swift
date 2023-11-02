//
//  CourseInfoViewModel.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 31/10/23.
//

import Foundation

class CourseInfoViewModel: ObservableObject {
    @Published var course = [Course]()
    
    var courseInfoRequirement: CourseInfoRequirementProtocol
    
    init(courseInfoRequirement: CourseInfoRequirementProtocol = CourseInfoRequirement.shared) {
        self.courseInfoRequirement = courseInfoRequirement
    }
    
    @MainActor
    func getCourse() async {
        let result = await courseInfoRequirement.getCourse(id: "653dd50ab18d421bfcef6a93")
        
        if let res = result {
            self.course = res.data ?? self.course
            print("ModelView: Received course data")
        } else {
            print("Failed to fetch course data")
        }
    }

}
