//
//  CompanyViewModel.swift
//  RRO
//
//  Created by Erik Cabrera on 06/11/23.
//

import Foundation

class CompanyViewModel: ObservableObject {
    @Published var companyList = [Company]()
    
    var companyListRequirement: CompanyListRequirementProtocol
    
    init(companyListRequirement: CompanyListRequirementProtocol = CompanyListRequirement.shared) {
        self.companyListRequirement = companyListRequirement
    }
    
    @MainActor
    func getCompanies() async {
        if let result = await companyListRequirement.getCompanyList(limit: 32, offset: 0){
            self.companyList = result.data ?? self.companyList
        
        }
        
    }
}
