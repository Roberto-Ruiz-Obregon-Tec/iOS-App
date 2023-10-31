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
                    .fontWeight(.medium)
                
                Spacer()
            }.padding(.bottom, 12)
            
            HStack {
                Text("Fecha límite")
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text(limitDate, format: .dateTime.day().month())
            }.padding(.bottom, 2)
            
            Divider()
            
            HStack {
                Text("Categoría")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(category)
            }.padding(.bottom, 12)
            
            Button {
                goDetail()
            } label: {
                Text("Ver más")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(4)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundStyle(Color.white)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(UIColor.systemGray4), lineWidth: 1.5)
            )
        .padding(10)
    }
}

struct ProgramInfoCardView_Preview: PreviewProvider {
    static var previews: some View {
        ProgramInfoCardView(
            name: "Programa",
            image: "",
            description: "Este programa es muy bueno, deberías de inscribirte y probarlo.",
            limitDate: Date(),
            category: "Creativa",
            goDetail: {}
        )
    }
}
