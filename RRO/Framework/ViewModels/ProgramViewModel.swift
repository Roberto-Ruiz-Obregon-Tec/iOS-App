//
//  ProgramViewModel.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

// Clase que representa el modelo de vista para la lista de programas.
class ProgramViewModel: ObservableObject {
    @Published var programList = [Program]() // Lista observable de programas./
    
    var programListRequirement: ProgramListRequirementProtocol // Requisito para obtener la lista de programas.
    
    // Inicializador de la clase.
    init(programListRequirement: ProgramListRequirementProtocol = ProgramListRequirement.shared) {
        self.programListRequirement = programListRequirement
    }
    // Función asincrónica para obtener la lista de programas.
    @MainActor
    func getPrograms() async {
        // Llama a la función asincrónica en programListRequirement para obtener la lista de programas.
        let result = await programListRequirement.getProgramList(limit: 32, offset: 0)
        if let res = result {
            // Si se obtiene un resultado, actualiza la lista de programas en el modelo de vista.
            self.programList = res.data ?? []
        }
        
    }
}
