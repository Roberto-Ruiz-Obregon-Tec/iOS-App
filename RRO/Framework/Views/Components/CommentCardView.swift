//
//  CommentCardView.swift
//  RRO
//
//  Created by Ramona NF on 24/11/23.
//

import SwiftUI
import FlowStacks
import SDWebImageSwiftUI

struct CommentCardView: View {
    @Environment(\.colorScheme) private var colorScheme
    let comment : Comments
    
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

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        let c = Comments(comment: "commentcomm", user: "user")
        CommentCardView(comment: c)
    }
}
