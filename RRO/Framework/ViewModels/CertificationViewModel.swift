//
//  CertificationViewModel.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation

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

