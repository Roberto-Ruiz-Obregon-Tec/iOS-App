//
//  myCoursesViewModel.swift
//  RRO
//
//  Created by user326 on 14/11/23.
//

import Foundation

// Clase del ViewModel
class MyCoursesViewModel: ObservableObject {
    // Propiedad observable que almacena la lista de cursos
    @Published var courseList = [Course]()
    @Published var userRating: Rating = Rating(id: "", rating: 0)
    
    var myCoursesListRequirement: MyCoursesListRequirementProtocol
    
    init(myCoursesListRequirement: MyCoursesListRequirementProtocol = MyCoursesListRequirement.shared) {
        self.myCoursesListRequirement = myCoursesListRequirement
    }
    
    // Función marcada con @MainActor para obtener la lista de cursos de forma asíncrona
    @MainActor
    func getMyCourses() async {
        // Llama a la función en el requisito para obtener la lista de cursos de forma asíncrona
        let result = await myCoursesListRequirement.getMyCourses()
        
        // Comprueba si el ViewModel recibio los datos correctamente
        if let res = result {
            self.courseList = res.data ?? self.courseList
            print("ModelView: Received course data")
        } else {
            print("Failed to fetch course data")
        }
    }

    @MainActor
    func updateCourseRating() async -> ServerResponse<[Course]>? {
        await myCoursesListRequirement.updateCourseRating(model: self.userRating)
    }
}
