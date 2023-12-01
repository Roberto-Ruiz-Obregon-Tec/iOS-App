//
//  CourseCommentCardView.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 25/11/23.
//

import SwiftUI
import FlowStacks
import SDWebImageSwiftUI

struct CourseCommentCardView: View {
    @Environment(\.colorScheme) private var colorScheme
    let comment : CourseComments
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "person.crop.square.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 39))
                
                Text(comment.user)
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Spacer()
            }
                    
            ExpandableText(text: comment.comment, limit : 40)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }.padding([.top], 8)
         .padding([.leading], 24)
         .padding([.trailing], 16)
         .frame(maxWidth: .infinity)
         .background(colorScheme == .dark ? Color(red: 0.10, green: 0.10, blue: 0.10) : Color(red: 0.97, green: 0.97, blue: 0.97))
    }
}
