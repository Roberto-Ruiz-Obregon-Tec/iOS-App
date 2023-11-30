//
//  CourseView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//
import SwiftUI


struct CoursesView: View {
    @StateObject var courseViewModel = CourseViewModel()
    @State private var filterText: String = ""


    var body: some View {
        VStack {
            TextField("Buscar cursos", text: $filterText)
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
                (filterText.isEmpty || $0.name.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(filterText.folding(options: .diacriticInsensitive, locale: .current).lowercased())) && $0.remaining > 0
            }).isEmpty && !filterText.isEmpty {
                // Using Spacer to center the content vertically
                Spacer()
                Text("No hay talleres con el nombre que buscas")
                Spacer()
            } else {
                ScrollView {
                    ForEach(courseViewModel.courseList.filter {
                        (filterText.isEmpty || $0.name.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(filterText.folding(options: .diacriticInsensitive, locale: .current).lowercased())) && $0.remaining > 0
                    }.filter { course in
                        // Add your new date filter here
                        guard let startDate = course.startDate?.toISODate() else { return true }
                        let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: startDate) ?? startDate
                        return nextDay > Date.now
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
