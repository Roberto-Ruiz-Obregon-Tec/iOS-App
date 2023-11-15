//
//  PublicationCardView.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import SwiftUI
import SDWebImageSwiftUI



struct PublicationCardView: View {
    let fecha = "13/11/2023"
    let descripcion = "Esta es una descripcion de prueba para ver como se ve en la card de publicaciones"
    let likes = 20
    let image = "https://img.freepik.com/foto-gratis/retrato-abstracto-ojo-elegancia-mujeres-jovenes-generado-ai_188544-9712.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699920000&semt=ais"
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                HStack() {
                    Image("logoFundacion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Nuevo curso disponible!")
                            .font(.title2).bold()
                        HStack {
                            Text("Publicado: \(fecha)")
                                .foregroundColor(.gray)
                            Image(systemName: "globe.americas.fill")
                        }
                    }
                    .frame(maxWidth: .infinity)
                 
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
                Text(descripcion)
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding([.top, .bottom])
                
                if image != "" {
                    WebImage(url: URL(string: image))
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
                        
                    
                    Text("\(likes)")
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
                        Image(systemName: "hand.thumbsup")
                        Text("Me gusta")
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "bubble.right")
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

struct PublicationCardView_Previews: PreviewProvider {
    static var previews: some View {
        PublicationCardView()
    }
}
