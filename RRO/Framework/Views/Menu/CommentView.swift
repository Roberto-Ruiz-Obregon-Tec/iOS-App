//
//  CommentView.swift
//  RRO
//
//  Created by Ramona NF on 23/11/23.
//

import SwiftUI
import FlowStacks
import SDWebImageSwiftUI

struct CommentView: View {
    let publication : Publication
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
             
            if(publication.comments.count == 0) {
                Spacer()
                
                Text("Aún no hay comentarios")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                
                Spacer()
            } else {
                ScrollView {
                    ForEach(0..<publication.comments.count, id: \.self) {
                        i in CommentCardView(comment: publication.comments[i])
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
            }
                
            Divider()
                .padding([.top], 11)
                .padding([.bottom], 8)
                
            HStack {
                TextField(text: $comment) {
                    Text("Comentario")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding([.top, .bottom], 8)
                 .padding([.leading], 16)
                 .overlay(
                     RoundedRectangle(cornerRadius: 16)
                         .stroke(Color.gray, lineWidth: 1)
                 )
                    
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 28))
            }.frame(maxWidth: .infinity)
                
        }.padding([.top, .bottom, .leading, .trailing], 16)
    }
}


