//
//  CourseView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//
import SwiftUI
//
import SwiftUI

// Vista principal que muestra la lista de cursos
struct CoursesView: View {
    @StateObject var courseViewModel = CourseViewModel() // Se crea una instancia del ViewModel
    @State private var filterText: String = "" // Estado para el texto de filtrado

    var body: some View {
        VStack {
            // Cuadro de texto para filtrar cursos por nombre
            TextField("Buscar talleres", text: $filterText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            ScrollView {
                ForEach(courseViewModel.courseList.filter {
                    // Filtra los cursos en función del texto de búsqueda
                    filterText.isEmpty || $0.name.lowercased().contains(filterText.lowercased())
                }) { course in
                    CourseInfoCardView(course: course) // Muestra una tarjeta de información del curso
                }
                
            }.onAppear {
                Task {
                    await courseViewModel.getCourseList() // Llama al método
                }
            }
        }
    }
}

    


struct CourseListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CoursesView(courseViewModel: getViewModel())
        }
    }
    
    /// Si no hay backend se generara esto:
    static var elems = 10
    static func getViewModel() -> CourseViewModel {
        let vm = CourseViewModel()
        for _ in 1...elems {
            vm.courseList.append(
                Course(id:UUID().uuidString, name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.",speaker: "", startDate: Date.now.toString(), endDate: Date.now.toString(), schedule: "", modality: "Presencial", postalCode: 0, location: "", status: "", cost: 99999, courseImage: "", capacity: 1, rating: 0, meetingCode: "", accessCode: "", focus: []))
            
            
        }
        
        return vm
    }
    
}
