//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import Foundation
import SwiftUI

struct BecasView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        Text("Becas")
        NavigationStack{
            List{ //Aqui se agregaran las Becas
                
            }
            .navigationTitle("Becas")
            .searchable(text: $searchTerm, prompt: "Search")
        }
    }
}
