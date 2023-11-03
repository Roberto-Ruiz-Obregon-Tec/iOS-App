//
//  ProgramDetailView.swift
//  RRO
//
//  Created by KARLA PADILLA on 30/10/23.
//

import SwiftUI

struct ProgramDetailView: View {
    var program: Program
    @State var admin = false
    
    var body: some View {
        Text("Henlo guord")
    }
}

struct ProgramDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        ProgramDetailView(program: Program(id: UUID().uuidString, name: "", startDate: Date.now.toString(), endDate: Date.now.toString(), deadlineDate: Date.now.toString(), programImage: "", postalCode: 1234, description: ""))
    }
    
    
}
