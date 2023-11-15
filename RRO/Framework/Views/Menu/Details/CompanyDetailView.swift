//
//  CompanyDetailView.swift
//  RRO
//
//  Created by Erik Cabrera on 06/11/23.
//

import Foundation
import SwiftUI

struct CompanyDetailView: View {
    var company: Company
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CompanyDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        CompanyDetailView(company: Company(id: UUID().uuidString, postalCode: "76000", name: "Compañía", description: "Descripción", phone: "Teléfono", certifications: []))
    }
}
