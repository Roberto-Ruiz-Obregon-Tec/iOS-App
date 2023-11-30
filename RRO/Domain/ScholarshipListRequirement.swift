//
//  ScholarshipListRequirement.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

protocol ScholarshipListRequirementProtocol {
    func getScholarshipList(limit: Int, offset: Int) async -> ServerResponse<ScholarshipData>?
}

class ScholarshipListRequirement: ScholarshipListRequirementProtocol {
    let dataRepository: ScholarshipRepository
    static let shared = ScholarshipListRequirement()
    
    init(dataRepository: ScholarshipRepository = ScholarshipRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getScholarshipList(limit: Int, offset: Int) async -> ServerResponse<ScholarshipData>? {
        return await dataRepository.getScholarshipList(limit: limit, offset: offset)
    }
}
