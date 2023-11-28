//
//  myCoursesListRequirement.swift
//  RRO
//
//  Created by user326 on 14/11/23.
//

import Foundation

/// Definición del protocolo
protocol MyCoursesListRequirementProtocol {
    func getMyCourses() async -> ServerResponse<[Course]>?
}

/// Clase para implementar el protocolo
class MyCoursesListRequirement: MyCoursesListRequirementProtocol {
    static let shared = MyCoursesListRequirement()
    let dataRepository: CourseRepository

    init(dataRepository: CourseRepository = CourseRepository.shared) { // Singleton
        self.dataRepository = dataRepository
    }

    /// Función del protocolo para recibir los datos del curso
    func getMyCourses() async -> ServerResponse<[Course]>? {
        return await dataRepository.getMyCourses()
    }
    
    /// Función del protocolo para recibir los datos del curso a actualizar
    func updateCourseRating(model: Rating) async -> ServerResponse<[Course]>? {
        return await dataRepository.updateCourseRating(model: model)
    }
}
