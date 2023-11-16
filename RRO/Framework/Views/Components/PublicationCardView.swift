//
//  PublicationCardView.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import SwiftUI
import SDWebImageSwiftUI



struct PublicationCardView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let publication : Publication
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                HStack() {
                    Image("logoFundacion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    VStack(alignment: .leading) {
                        Text(publication.title)
                            .font(.title2).bold()
                        HStack {
                            Text("Publicado: \(publication.updatedAt.toISODate(), format: .dateTime.day().month().year())")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Image(systemName: "globe.americas.fill")
                        }
                    }
                    .frame(maxWidth: .infinity)
                 
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
          
                
                Text(publication.description)
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding([.top, .bottom])
                
                if publication.image != "" {
                    WebImage(url: URL(string: publication.image))
                        .resizable()
                        .cornerRadius(4)
                        .scaledToFit()
                } else {
                    Image("DefaultImage")
                        .resizable()
                        .cornerRadius(16)
                        .scaledToFit()
                }
                HStack {
                    Image(systemName: "hand.thumbsup.circle.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .colorMultiply(Color.red)
                        .scaledToFit()
                        .frame(width: 20)
                        .padding(.top, 4)
                        
                    
                    Text("\(publication.likes)")
                        .padding(.top, 4)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.bottom, 4)
                
                Divider()
                    .frame(height: 0.5)
                    .overlay(.gray)

                
                HStack {
                    HStack{
                        Button {
                           print("Like")
                        } label : {
                            Image(systemName: "hand.thumbsup")
                                .tint(colorScheme == .dark ? .white : .black)
                        }
                        
                        Text("Me gusta")
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button {
                           print("Comentar")
                        } label : {
                            Image(systemName: "bubble.right")
                                .tint(colorScheme == .dark ? .white : .black)
                        }
                        
                        Text("Comentar")
                    }
                    
                }
                .padding(.top, 8)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            ).padding(10)
        }
    }
}

//struct PublicationCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PublicationCardView()
//    }
//}
