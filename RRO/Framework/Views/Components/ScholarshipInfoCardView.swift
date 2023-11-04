//
//  ScholarshipInfoCardView.swift
//  RRO
//
//  Created by Amy Gregg on 31/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ScholarshipInfoCardView: View {
    let scholarship: Scholarship
    var body: some View {
        NavigationStack{
            VStack {
                if scholarship.image != "" {
                    WebImage(url: URL(string: scholarship.image))
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
                    Text(scholarship.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                HStack {
                    Text(scholarship.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                HStack {
                    Text("Fecha")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(scholarship.startDate.toISODate(), format: .dateTime.day().month())
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    Text("Sector")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text(scholarship.sector)
                }.padding(.bottom, 2)
                
                Divider()
                
                HStack {
                    Text("Organización")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(scholarship.organization)
                }.padding(.bottom, 12)
                
                NavigationLink {
                    ScholarshipDetailView(scholarship: scholarship)
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
    ScholarshipInfoCardView(scholarship: Scholarship(
        id:UUID().uuidString,
        name: "Beca",
        description: "Descripción del beca",
        organization: "University of Oregon",
        location: "Oregon, EE.UU.",
        email: "",
        phone: "",
        image: "",
        sector: "smth",
        startDate: Date.now.toString(),
        endDate: Date.now.toString()))
}
