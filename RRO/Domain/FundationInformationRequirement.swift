//
//  FundationInformationRequirement.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation

///  Defines a protocol (FundationInformationRequirementProtocol) and a corresponding implementation class (FundationInformationRequirement) to abstract the requirements for foundation information in the "RRO" app
protocol FundationInformationRequirementProtocol{
    func getInfoFundation(limit: Int) async -> ServerResponse<[InfoFundation]>?
}

class FundationInformationRequirement:FundationInformationRequirementProtocol{
    
    let dataRepository: FundationInformationRepository
    static let shared = FundationInformationRequirement()
    
    init (dataRepository: FundationInformationRepository = FundationInformationRepository.shared){
        self.dataRepository = dataRepository
    }
    
    func getInfoFundation(limit: Int) async -> ServerResponse<[InfoFundation]>?{
        return await dataRepository.getInfoFundation(limit: limit)
    }
}
