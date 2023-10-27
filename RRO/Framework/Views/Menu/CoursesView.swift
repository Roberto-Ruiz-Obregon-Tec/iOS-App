//
//  CourseView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        NavigationStack {
            // TODO: This VStack should be a List in the future
            VStack {
                Text("Cursos")
                
                NavigationLink {
                    // TODO: Add state or course info
                    CourseDetailView()
                } label: {
                    Text("Curso1")
                }.padding()
                
                NavigationLink {
                    // TODO: Add state or course info
                    CourseDetailView()
                } label: {
                    Text("Curso2")
                }.padding()
            }
        }
    }
}

#Preview {
    CoursesView()
}
