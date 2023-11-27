//
//  CoursesCommentsView.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//


import SwiftUI
import FlowStacks
import SDWebImageSwiftUI

struct CourseCommentsView: View {
    let course : Course
    @State var comment: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer().frame(width: 44)
                Spacer()
                
                Text("Comentarios")
                    .font(.title)
                    .frame(alignment: .center)
                
                Spacer()
                Image("logoFundacion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44)
            }.padding([.bottom], 12)
             .frame(maxWidth: .infinity)
             
            if(course.comments!.count == 0) {
                Spacer()
                
                Text("Aún no hay comentarios")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                
                Spacer()
            } else {
                ScrollView {
                    ForEach(0..<course.comments!.count, id: \.self) {
                        i in CourseCommentCardView(comment: course.comments![i])
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
            }
                
                      
                
        }.padding([.top, .bottom, .leading, .trailing], 16)
    }
}
