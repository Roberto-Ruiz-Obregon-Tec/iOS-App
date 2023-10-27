//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import SwiftUI

struct CertificationView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        Text("Certifications")
        NavigationStack{
            List{ //Aqui se agregaran las certificaciones
                
            }
            .navigationTitle("Certifications")
            .searchable(text: $searchTerm, prompt: "Search")
        }
    }
}

