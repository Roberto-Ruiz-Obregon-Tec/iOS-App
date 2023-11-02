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
        
    NavigationStack {
        
        TextField("Buscar talleres", text: $filterText)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        
        ScrollView{
            ForEach(courseViewModel.courseList.filter {
                filterText.isEmpty || $0.name.lowercased().contains(filterText.lowercased())
            }) { course in
                CourseInfoCardView(course: course)
            }
            
        
        }
    }

        .padding(.horizontal)
        .onAppear {
            Task {
                await courseViewModel.getCourseList() // Call the method
            }
        }
    }
}
    
//#Preview {
//    CoursesView()
//}


struct CourseListViewPreviews: PreviewProvider {
    static var previews: some View {
        CoursesView(courseViewModel: getViewModel())
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
//struct CoursesView: View {
//    @State var coursesList: ServerResponse<[Course]>?
//    @State var course: ServerResponse<[Course]>?
//
//    var body: some View {
//        VStack {
//            Text("Test info")
//                .font(.largeTitle)
//
//            Text("\nStatus: \(coursesList?.status ?? "")")
//                .font(.body)
//
//            let tst = (coursesList?.data ?? [])
//            if (tst.count > 0) {
//                List(tst) {
//                    t in VStack {
//                        Text("Name: \(t.name)")
//                        Text("id: \(t.id)")
//                    }
//                }
//            }
//
//        }.onAppear {
//            Task {
//                await getCourseList()
//            }
//        }
//
//        Spacer(minLength: 8)
//
//        VStack {
//            Text("One test")
//                .font(.largeTitle)
//
//            Text("\nStatus: \(course?.status ?? "")")
//                .font(.body)
//
//            let tst = (course?.data ?? [])
//            if (tst.count > 0) {
//                Text("Name: \(tst[0].name)")
//                Text("description: \(tst[0].description)")
//            }
//
//        }.onAppear {
//            Task {
//                await getCourse()
//            }
//        }
//
//        Spacer(minLength: 4)
//    }
//
//    func getCourseList() async {
//        let courseRepository = CourseRepository()
//        let result = await courseRepository.getCourseList(limit: 32, offset: 0)
//
//        coursesList = result
//    }
//
//    func getCourse() async {
//        let courseRepository = CourseRepository()
//        let result = await courseRepository.getCourse(id: "653de831b18d421bfc22c264")
//
//        course = result
//    }
//}


