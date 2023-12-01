//
//  CourseRepository.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

class CourseRepository: CourseAPIProtocol {
    let netService: NetworkAPIService
    static let shared = CourseRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) { // Singleton
        self.netService = netService // Inicializamos la instancia shared
    }
    
    func getCourseList() async -> ServerResponse<[Course]>?{
        let params = [ // Parametros a agregar en el request
            "cost[gte]": 0
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)")!, params: params)
    }
    
    /// Función para obtener la lista de cursos del usuario.
    func getMyCourses() async -> ServerResponse<[Course]>? {
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.myCourses)")!)
    }
    
    /// Función para obtener información de un curso en específico.
    ///
    /// - Parametros:
    ///   - id: El id del curso.
    ///
    /// - Return: La información del curso correspondiente con el id.
    func getCourse(id: String) async -> ServerResponse<[Course]>? {
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)/\(id)")!)
    }
    
    /// Función para actualizar el rating de un curso.
    ///
    /// - Parámetros:
    ///   - model: Contiene el id del curso y el rating a asignar.
    ///
    /// - Return: Response status.
    func updateCourseRating(model: Rating) async -> ServerResponse<[Course]>? {
        let body:[String:Any] = [
            "id": model.id,
            "rating": model.rating
        ]
        
        return await netService.self.put(url: URL(string: "\(API.base)\(API.routes.courseRating)")!, body: body)
    }
    
    /// Función para publicar un comentario a un curso.
    ///
    /// - Parámetros:
    ///   - courseId: Contiene el id del curso.
    ///   - comment: Contiene el comentario.
    ///
    /// - Return: Response status.
    func createCourseComment(courseId: String, comment: String) async -> ServerResponse<Course>? {
        let body = [
            "course": courseId,
            "comment": comment
        ]
        
        return await netService.self.post(url: URL(string: "\(API.base)\(API.routes.createCourseComment)")!, body: body)
    }
    
    func createCourseInscription(courseId: String, voucher: String?) async -> ServerResponse<String>? {
        let body = [
            "courseId": courseId,
            "voucher": voucher
        ]
        
        return await netService.self.post(url: URL(string: "\(API.base)\(API.routes.inscribeToCourse)")!, body: body)
    }
}
