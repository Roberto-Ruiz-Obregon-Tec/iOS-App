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
    var createCourseCommentRequirement : CreateCourseCommentProtocol
    
    init(courseListRequirement: CourseListRequirementProtocol = CourseListRequirement.shared, createCourseCommentRequirement: CreateCourseCommentRequirement = CreateCourseCommentRequirement.shared) {
        self.courseListRequirement = courseListRequirement
        self.createCourseCommentRequirement = createCourseCommentRequirement
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
    
    @MainActor
    func createCourseComment(courseId: String, comment: String) async {
        let result = await createCourseCommentRequirement.createCourseComment(courseId : courseId, comment: comment)
        
        if result?.status == "success" {
            print("Comentario hecho con éxito")
        } else {
            print("Error al comentar")
        }
    }
}

