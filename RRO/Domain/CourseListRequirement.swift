//
//  CourseListRequirement.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

/// Definición del protocolo
protocol CourseListRequirementProtocol {
    func getCourseList() async -> ServerResponse<[Course]>?
}

/// Clase para implementar el protocolo
class CourseListRequirement: CourseListRequirementProtocol {
    static let shared = CourseListRequirement()
    let dataRepository: CourseRepository

    init(dataRepository: CourseRepository = CourseRepository.shared) { // Singleton
        self.dataRepository = dataRepository
    }

    /// Función del protocolo para recibir los datos del curso
    func getCourseList() async -> ServerResponse<[Course]>? {
        return await dataRepository.getCourseList()
    }
}
