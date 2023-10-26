//
//  InfoCardView.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProgramInfoCardView: View {
    let name: String
    let image: String
    let description: String
    let limitDate: Date
    let category: String
    let goDetail: () -> Void
    
    var body: some View {
        VStack {
            if image != "" {
                WebImage(url: URL(string: image))
                    .resizable()
                    .cornerRadius(16)
                    .scaledToFit()
            } else {
                Image("DefaultImage")
                    .resizable()
                    .cornerRadius(16)
                    .scaledToFit()
            }
            
            HStack {
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.bottom, 8)
            
            HStack {
                Text(description)
                    .foregroundStyle(.secondary)
                Spacer()
            }.padding(.bottom, 8)
            
            HStack {
                Text("Fecha limite")
                    .font(.title3)
                
                Spacer()
                
                Text(limitDate, format: .dateTime.day().month())
            }.padding(.bottom, 8)
            
            Divider()
            
            HStack {
                Text("Categoría")
                    .font(.title3)
                Spacer()
                Text(category)
            }.padding(.bottom, 8)
            
            Button {
                goDetail()
            } label: {
                Text("Ver más")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundStyle(Color.white)
        }
        .padding()
        
        
        
    }
}

#Preview {
    ProgramInfoCardView(name: "Titulo", image: "", description: "Karla", limitDate: Date.now, category: "Creativa", goDetail: {})
}
