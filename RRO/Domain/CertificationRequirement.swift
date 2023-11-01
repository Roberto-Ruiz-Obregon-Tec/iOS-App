//
//  CertificationRequirement.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation

protocol CertificationListRequirementProtocol {
    func getCertificationList(limit: Int) async -> CertificationResponse<[Certification]>?
}

class CertificationListRequirement: CertificationListRequirementProtocol {
    let dataRepository: CertificationRepository
    static let shared = CertificationListRequirement()
    
    init(dataRepository: CertificationRepository = CertificationRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getCertificationList(limit: Int) async -> CertificationResponse<[Certification]>? {
        return await dataRepository.getCertificationList(limit: limit)
    }
}
