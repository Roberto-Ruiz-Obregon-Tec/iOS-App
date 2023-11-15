//
//  FundationInformationViewModel.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation

/// Defines a ViewModel (FundationInformationViewModel) in the "RRO" app, responsible for managing foundation information. It uses the infoFundacionRequirement property, conforming to the FundationInformationRequirementProtocol, to fetch foundation information asynchronously.
class FundationInformationViewModel: ObservableObject{
    @Published var infoFundation = [InfoFundation]()
    
    var infoFundacionRequirement: FundationInformationRequirementProtocol
    
    init(infoFundacionRequirement:FundationInformationRequirementProtocol =  FundationInformationRequirement.shared){
        self.infoFundacionRequirement = infoFundacionRequirement
    }
    
    @MainActor
    func getInfoFundation() async{
        if let result = await infoFundacionRequirement.getInfoFundation(limit: 1){
            self.infoFundation = result.data ?? self.infoFundation
        }
    }
    
}
