//
//  ProgramListView.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import SwiftUI

// Define una vista en SwiftUI llamada ProgramListView.
struct ProgramListView: View {
    @StateObject var programViewModel = ProgramViewModel()
    
    var body: some View {
        VStack {
            // Verifica si la lista de programas en programViewModel está vacía.
            if programViewModel.programList.isEmpty{
                Text("No hay programas disponibles en este momento")
                    .padding()
            } else {
                ScrollView{
                    // Itera sobre la lista de programas y muestra una tarjeta ProgramInfoCardView para cada programa.
                    ForEach(programViewModel.programList){program in
                        ProgramInfoCardView(program: program)
                    }
                    
                }
            }
        }.onAppear(){
            // En el momento en que la vista aparece, ejecuta la función asíncrona para obtener los programas.
            Task {
                await programViewModel.getPrograms()
            }
        }
    }
}

// Vista de previsualización para la vista ProgramListView.
struct ProgramListViewPreviews: PreviewProvider {
    static var previews: some View {
        // Envuelve la vista ProgramListView en un NavigationStack para la previsualización.
        NavigationStack {
            ProgramListView (programViewModel: getViewModel())
        }
    }
    
    /// If there is no backend the preview will generate this ammount of card elements
    static var elems = 10
    // Función para crear un objeto ProgramViewModel con datos de programa de ejemplo para la previsualización.
    static func getViewModel() -> ProgramViewModel {
        let vm = ProgramViewModel()
        for _ in 1...elems {
            vm.programList.append(
                Program(id: UUID().uuidString, name: "", startDate: Date.now.toString(), endDate: Date.now.toString(), deadlineDate: Date.now.toString(), programImage: "", postalCode: 123, description: "")
            )
        }
        
        return vm
    }
}
