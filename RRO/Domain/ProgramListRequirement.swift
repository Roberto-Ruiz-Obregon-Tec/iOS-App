//
//  ProgramListRequirement.swift
//  RRO
//
//  Created by KARLA PADILLA on 26/10/23.
//

import Foundation

protocol ProgramListRequirementProtocol {
    func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>?
}

class ProgramListRequirement: ProgramListRequirementProtocol {
let dataRepository: ProgramRepository
static let shared = ProgramListRequirement()

init(dataRepository: ProgramRepository = ProgramRepository.shared) {
    self.dataRepository = dataRepository
}

func getProgramList(limit: Int, offset: Int) async -> ServerResponse<[Program]>? {
    return await dataRepository.getProgramList(limit: limit, offset: offset)
}
}

