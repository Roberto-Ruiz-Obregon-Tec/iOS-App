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
    
    @StateObject var publicationViewModel = PublicationViewModel()
    @State var comment: String = ""
    @State var success : Bool = false
    
    
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
                Button (action : {
                    Task {
                        if comment.trimmingCharacters(in: .whitespacesAndNewlines).count > 0{
                            await publicationViewModel.createPublicationComment(publicationId: publication.id, comment: comment)
                            
                            comment = ""
                            success = true
                            
                        }
                    }
                    
                }, label : {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 28))
                })
                    .alert(isPresented: $success, content: {
                        Alert(
                            title: Text("Éxito"),
                            message: Text("El comentario está en espera de revisión")
                        )
                    })

            }.frame(maxWidth: .infinity)
                
        }.padding([.top, .bottom, .leading, .trailing], 16)

    }
}


