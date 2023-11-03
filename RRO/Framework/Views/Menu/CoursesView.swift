//
//  CourseView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//
import SwiftUI
//
struct CoursesView: View {
    @StateObject var courseViewModel = CourseViewModel()
    @State private var filterText: String = ""


    var body: some View {
        VStack {
            TextField("Buscar talleres", text: $filterText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            ScrollView{
                ForEach(courseViewModel.courseList.filter {
                    filterText.isEmpty || $0.name.lowercased().contains(filterText.lowercased())
                }) { course in
                    CourseInfoCardView(course: course)
                }
                
            }.onAppear {
                Task {
                    await courseViewModel.getCourseList() // Call the method
                }
            }
        }
    }
}
    
//#Preview {
//    CoursesView()
//}


struct CourseListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CoursesView(courseViewModel: getViewModel())
        }
    }
    
    /// If there is no backend the preview will generate this ammount of card elements
    static var elems = 10
    static func getViewModel() -> CourseViewModel {
        let vm = CourseViewModel()
        for _ in 1...elems {
            vm.courseList.append(
                Course(id:UUID().uuidString, name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.",speaker: "", startDate: Date.now.toString(), endDate: Date.now.toString(), schedule: "", modality: "Presencial", postalCode: 0, location: "", status: "", cost: 1200, courseImage: "", capacity: 1, rating: 0, meetingCode: "", accessCode: "", focus: []))
            
            
        }
        
        return vm
    }
    
}
