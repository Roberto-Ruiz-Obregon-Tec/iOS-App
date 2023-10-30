//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import Foundation
import SwiftUI

struct CursosView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        Text("Cursos")
        NavigationStack{
            List{ //Aqui se agregaran las Cursos
                
            }
            .navigationTitle("Cursos")
            .searchable(text: $searchTerm, prompt: "Search")
        }
    }
}
