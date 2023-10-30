//
//  InfoCardView.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProgramInfoCardView: View {
    let program: Program
    var body: some View {
        NavigationStack {
            VStack {
                if program.programImage != "" {
                    WebImage(url: URL(string: program.programImage))
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
                    Text(program.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                HStack {
                    Text(program.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                HStack {
                    Text("Fecha límite")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(program.deadlineDate, format: .dateTime.day().month())
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    Text("Categoría")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(program.category)
                }.padding(.bottom, 12)
                
                NavigationLink {
                    ProgramDetailView(program: program)
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
}

#Preview {
    ProgramInfoCardView(program: Program(id: UUID().uuidString, name: "Karla", startDate: Date.now, category: "Studio F", endDate: Date.now, deadlineDate: Date.now, programImage: "", postalCode: 123, description: "Karla la maravilla"))
}
