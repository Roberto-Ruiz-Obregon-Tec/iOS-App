//
//  CourseView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//
import SwiftUI
// Vista principal que muestra la lista de cursos
struct CoursesView: View {
    @StateObject var courseViewModel = CourseViewModel()
    @State private var filterText: String = ""

    var body: some View {
        VStack {
            TextField("Buscar talleres", text: $filterText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.leading, 20)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
            
            if courseViewModel.courseList.filter({
                filterText.isEmpty || $0.name.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(filterText.folding(options: .diacriticInsensitive, locale: .current).lowercased())
            }).isEmpty && !filterText.isEmpty {
                // Usando Spacer para empujar el contenido al centro
                Spacer()
                Text("No hay talleres con el nombre que buscas")
                Spacer()
            } else {
                ScrollView {
                    ForEach(courseViewModel.courseList.filter {
                        filterText.isEmpty || $0.name.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(filterText.folding(options: .diacriticInsensitive, locale: .current).lowercased())
                    }) { course in
                        CourseInfoCardView(course: course)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await courseViewModel.getCourseList()
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
                Course(id:UUID().uuidString, name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.",speaker: "", startDate: Date.now.toString(), endDate: Date.now.toString(), schedule: "11:30", modality: "Presencial", postalCode: 0, location: "tu cola", status: "Gratuito", cost: 9, courseImage: "", capacity: 1, rating: 0, meetingCode: "", accessCode: "", focus: []))
            
            
        }
        
        return vm
    }
    
}
