//
//  CertificationInfoCardView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CertificationInfoCardView: View {
    let name: String
    let description: String
    let goDetail: () -> Void
    
    var body: some View {
        VStack {
            
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
            
            Button(action: {
                goDetail()
            }) {
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

struct CertificationInfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationInfoCardView(
            name: "Programa",
            description: "Este programa es muy bueno, deberías de inscribirte y probarlo.",
            goDetail: {}
        )
    }
}

