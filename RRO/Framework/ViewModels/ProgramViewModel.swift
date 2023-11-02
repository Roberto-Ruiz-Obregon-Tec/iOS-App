//
//  ProgramViewModel.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

class ProgramViewModel: ObservableObject {
    @Published var programList = [Program]()
    
    var programListRequirement: ProgramListRequirementProtocol
    
    init(programListRequirement: ProgramListRequirementProtocol = ProgramListRequirement.shared) {
        self.programListRequirement = programListRequirement
    }
    
    @MainActor
    func getPrograms() async {
        let result = await programListRequirement.getProgramList(limit: 32, offset: 0)
        if let res = result {
            self.programList = res.data ?? []
        }
        
    }
}
