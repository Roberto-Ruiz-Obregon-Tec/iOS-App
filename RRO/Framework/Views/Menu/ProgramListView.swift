//
//  ProgramListView.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import SwiftUI

struct ProgramListView: View {
    @StateObject var programViewModel = ProgramViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(programViewModel.programList) {program in
                ProgramInfoCardView(name: program.name, image: program.programImage, description: program.description, limitDate: program.deadlineDate, category: "", goDetail: {})
            }
        
        }
        .padding(.horizontal)
        .onAppear {
            Task {
                await programViewModel.getPrograms()
            }
        }
    }
}
<<<<<<< HEAD
=======

struct ProgramListPreview: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}
>>>>>>> dev
