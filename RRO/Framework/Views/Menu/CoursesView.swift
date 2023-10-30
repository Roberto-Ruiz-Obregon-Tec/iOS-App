//
//  CourseView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct CoursesView: View {
    @StateObject var courseViewModel = CourseViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                if courseViewModel.courseList.isEmpty {
                    // TODO: Notify network error
                    // TODO: Loading view
                    Text("No hay talleres en este momento")
                        .padding()
                } else {
                    List(courseViewModel.courseList) { course in
                        NavigationLink {
                            CourseDetailView(course: course)
                        } label: {
                            Text(course.name)
                        }.padding()
                    }
                }
            }
            .onAppear {
                Task {
                    await courseViewModel.getCourseList() // Call the method
                }
            }
        }
    }
}


//struct CoursesView: View {
//    @StateObject var courseViewModel = CourseViewModel()
//    var body: some View {
//        NavigationStack {
//            // TODO: This VStack should be a List in the future
//            VStack {
//                Text("Cursos")
//                
//                NavigationLink {
//                    // TODO: Add state or course info
//                    CourseDetailView()
//                } label: {
//                    Text("Curso1")
//                }.padding()
//                
//                NavigationLink {
//                    // TODO: Add state or course info
//                    CourseDetailView()
//                } label: {
//                    Text("Curso2")
//                }.padding()
//            }
//        }
//    }
//}

#Preview {
    CoursesView()
}
