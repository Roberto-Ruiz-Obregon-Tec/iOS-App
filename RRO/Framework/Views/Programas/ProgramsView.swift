//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import Foundation
import SwiftUI

struct ProgramsView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        Text("Programas")
        NavigationStack{
            List{ //Aqui se agregaran las Programas
                
            }
            .navigationTitle("Programas")
            .searchable(text: $searchTerm, prompt: "Search")
        }
    }
}
