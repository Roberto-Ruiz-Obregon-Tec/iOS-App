//
//  CompanyInfoCardView.swift
//  RRO
//
//  Created by Erik Cabrera on 06/11/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CompanyInfoCardView: View {
    let company: Company
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text(company.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 8)
                
                HStack {
                    Text(company.description)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    
                    Spacer()
                }.padding(.bottom, 12)
                
                    HStack {
                        Text("Certificaciones")
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    
                    
                    Text(company.certifications.joined(separator: ", "))
            
                }.padding(.bottom, 2)
                
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


struct CompanyInfoCardPreview: PreviewProvider {
    static var previews: some View {
        CompanyInfoCardView(company: Company(id:UUID().uuidString, postalCode: "76000", name: "Compañía", description: "Descripción", phone: "Teléfono", certifications: ["Certificación 1", "Certificación 2"]))
    }
}

