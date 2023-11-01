//
//  FundationInformationRequirement.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation

protocol FundationInformationRequirementProtocol{
    func getInfoFundation(limit: Int) async -> FoundationResponse<InfoFundation>?
}

class FundationInformationRequirement:FundationInformationRequirementProtocol{
    
    let dataRepository: FundationInformationRepository
    static let shared = FundationInformationRequirement()
    
    init (dataRepository: FundationInformationRepository = FundationInformationRepository.shared){
        self.dataRepository = dataRepository
    }
    
    func getInfoFundation(limit: Int) async -> FoundationResponse<InfoFundation>?{
        return await dataRepository.getInfoFundation(limit: limit)
    }
}
