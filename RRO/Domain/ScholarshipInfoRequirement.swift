//
//  ScholarshipInfoRequirement.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

protocol ScholarshipInfoRequirementProtocol {
    func getScholarshipInfo(id: String) async -> ServerResponse<Scholarship>?
    
}

class ScholarshipInfoRequirement: ScholarshipInfoRequirementProtocol {
    let dataRepository: ScholarshipRepository
    static let shared = ScholarshipInfoRequirement()
    
    init(dataRepository: ScholarshipRepository = ScholarshipRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getScholarshipInfo(id: String) async -> ServerResponse<Scholarship>? {
        return await dataRepository.getScholarship(id: id)
    }
    
    
}
