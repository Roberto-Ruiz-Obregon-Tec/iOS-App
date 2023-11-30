//
//  CreateCourseCommentRequirement.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 30/11/23.
//

protocol CreateCourseCommentProtocol {
    func createCourseComment(courseId: String, comment: String) async -> ServerResponse<Course>?
}


/// Clase para implementar el protocolo
class CreateCourseCommentRequirement : CreateCourseCommentProtocol {
    static let shared = CreateCourseCommentRequirement()
    let dataRepository : CourseRepository
    
    init(dataRepository : CourseRepository = CourseRepository.shared) { //Singleton
        self.dataRepository = dataRepository // Inicializamos la instancia shared
    }
    
    /// Función del protocolo para enviar los datos del comentario del curso
    func createCourseComment(courseId: String, comment: String) async -> ServerResponse<Course>? {
        return await dataRepository.createCourseComment(courseId: courseId, comment: comment)
    }
}
