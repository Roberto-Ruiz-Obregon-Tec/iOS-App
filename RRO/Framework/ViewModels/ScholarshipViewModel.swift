//
//  ScholarshipViewModel.swift
//  RRO
//
//  Created by peblo on 24/10/23.
//

import Foundation

class ScholarshipViewModel: ObservableObject {
    @Published var scholarshipList = [Scholarship]()
    
    var scholarshipListRequirement: ScholarshipListRequirementProtocol
    var scholarshipInfoRequirement: ScholarshipInfoRequirementProtocol
    
    init(scholarshipListRequirement: ScholarshipListRequirementProtocol = ScholarshipListRequirement.shared,
         scholarshipInfoRequirement: ScholarshipInfoRequirementProtocol = ScholarshipInfoRequirement.shared) {
        self.scholarshipListRequirement = scholarshipListRequirement
        self.scholarshipInfoRequirement = scholarshipInfoRequirement
    }
    
    @MainActor
    func getScholarsipList() async {
        let result = await scholarshipListRequirement.getScholarshipList(limit: 32, offset: 0)
        if let res = result {
            self.scholarshipList = res.data ?? self.scholarshipList
        }
    }
}
