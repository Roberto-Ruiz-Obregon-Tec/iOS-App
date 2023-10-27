//
//  CertificationAvView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 25/10/23.
//
import SwiftUI

struct CertificationAvView: View {
    var body: some View {
        NavigationView {
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

struct CertificationAvView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationAvView()
    }
}

