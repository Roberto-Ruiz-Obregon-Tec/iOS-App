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
        NavigationStack{
            if programViewModel.programList.isEmpty{
                Text("No hay programas disponibles en este momento")
                    .padding()
            } else{
                ScrollView{
                    ForEach(programViewModel.programList){program in
                        ProgramInfoCardView(program: program)
                    }
                    
                }
                .padding(.horizontal)
            }
        }.onAppear(){
            Task {
                await programViewModel.getPrograms()
            }
        }
    }
}

struct ProgramListViewPreviews: PreviewProvider {
    static var previews: some View {
        ProgramListView (programViewModel: getViewModel())
    }
    
    /// If there is no backend the preview will generate this ammount of card elements
    static var elems = 10
    static func getViewModel() -> ProgramViewModel {
        let vm = ProgramViewModel()
        for _ in 1...elems {
            vm.programList.append(
                Program(id: UUID().uuidString, name: "", startDate: Date.now, category: "", endDate: Date.now, deadlineDate: Date.now, programImage: "", postalCode: 123, description: "")
            )
        }
        
        return vm
    }
}


