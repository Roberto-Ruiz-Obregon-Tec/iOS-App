//
//  CourseViewModel.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

// Clase del ViewModel
class CourseViewModel: ObservableObject {
    // Propiedad observable que almacena la lista de cursos
    @Published var courseList = [Course]()
    
    var courseListRequirement: CourseListRequirementProtocol
    
    init(courseListRequirement: CourseListRequirementProtocol = CourseListRequirement.shared) {
        self.courseListRequirement = courseListRequirement
    }
    
    // Función marcada con @MainActor para obtener la lista de cursos de forma asíncrona
    @MainActor
    func getCourseList() async {
        // Llama a la función en el requisito para obtener la lista de cursos de forma asíncrona
        let result = await courseListRequirement.getCourseList()
        
        // Comprueba si el ViewModel recibio los datos correctamente
        if let res = result {
            self.courseList = res.data ?? self.courseList
            print("ModelView: Received course data")
        } else {
            print("Failed to fetch course data")
        }
    }

}

