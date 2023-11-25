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
    let comment : Comments
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "person.crop.square.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 39))
                
                Text(comment.user)
                        .font(.headline)
                
                Spacer()
            }
                    
            ExpandableText(text: comment.comment, limit : 40)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }.padding([.top], 8)
         .padding([.leading], 24)
         .padding([.trailing], 16)
         .frame(maxWidth: .infinity)
         .background(Color(red: 0.97, green: 0.97, blue: 0.97))
    }
}

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        let c = Comments(comment: "commentcomm", user: "user")
        CommentCardView(comment: c)
    }
}
