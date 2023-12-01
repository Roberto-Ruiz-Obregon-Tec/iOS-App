//
//  CourseViewModel.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

class CourseViewModel: ObservableObject {
    @Published var courseList = [Course]()
    @Published var messageTitle: String
    @Published var messageBody: String
    @Published var showAlert: Bool
    
    var courseListRequirement: CourseListRequirementProtocol
    var createCourseCommentRequirement : CreateCourseCommentProtocol
    var courseInfoRequirement: CourseInfoRequirementProtocol
    
    
    init(courseListRequirement: CourseListRequirementProtocol = CourseListRequirement.shared,
         createCourseCommentRequirement: CreateCourseCommentRequirement = CreateCourseCommentRequirement.shared,
         courseInfoRequirement: CourseInfoRequirementProtocol = CourseInfoRequirement.shared) {
        self.courseListRequirement = courseListRequirement
        self.createCourseCommentRequirement = createCourseCommentRequirement
        self.courseInfoRequirement = courseInfoRequirement
        self.messageTitle = "Error"
        self.messageBody = "Error"
        self.showAlert = false
    }
    
    @MainActor
    func getCourseList() async {
        let result = await courseListRequirement.getCourseList()
        
        if let res = result {
            print(res)
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
    
    @MainActor
    func createCourseInscription(courseId: String, voucher: String?) async {
        let result = await courseInfoRequirement.createCourseInscription(courseId: courseId, voucher: voucher)
        
        if result?.status == "success" {
            self.messageTitle = "Éxito"
            self.messageBody = result?.message ?? "Se creó con éxito tu inscripción"
            self.showAlert = true
        } else {
            self.messageTitle = "Error"
            self.messageBody = result?.message ?? self.messageBody
            self.showAlert = true
        }
    }
}

