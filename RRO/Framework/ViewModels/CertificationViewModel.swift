//
//  CertificationViewModel.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation


/// Defines a ViewModel (CertificationViewModel) for managing certification-related data in the "RRO" app. It uses the certificationListRequirement property, conforming to the CertificationListRequirementProtocol, to asynchronously fetch a list of certifications
class CertificationViewModel: ObservableObject {
    @Published var certificationList = [Certification]()
    
    var certificationListRequirement: CertificationListRequirementProtocol
    
    init(certificationListRequirement: CertificationListRequirementProtocol = CertificationListRequirement.shared) {
        self.certificationListRequirement = certificationListRequirement
    }
    
    @MainActor
    func getCertificationList() async{
        if let result = await certificationListRequirement.getCertificationList(limit: 32){
            self.certificationList = result.data ?? self.certificationList
        }
    }
}

