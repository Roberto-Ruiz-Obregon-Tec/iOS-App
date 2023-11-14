//
//  CertificationRequirement.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation


/// Defines a protocol (CertificationListRequirementProtocol) and its implementation (CertificationListRequirement) to encapsulate the requirements for certification lists in the "RRO" app
protocol CertificationListRequirementProtocol {
    func getCertificationList(limit: Int) async -> ServerResponse<[Certification]>?
}

class CertificationListRequirement: CertificationListRequirementProtocol {
    let dataRepository: CertificationRepository
    static let shared = CertificationListRequirement()
    
    init(dataRepository: CertificationRepository = CertificationRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getCertificationList(limit: Int) async -> ServerResponse<[Certification]>? {
        return await dataRepository.getCertificationList(limit: limit)
    }
}
