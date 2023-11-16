//
//  PublicationViewModel.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

class PublicationViewModel : ObservableObject {
    @Published var publicationList = [Publication]()
    
    var publicationListRequirement : PublicationListRequirementProtocol
    
    init(publicationListRequirement : PublicationListRequirementProtocol = PublicationListRequirement.shared) {
        self.publicationListRequirement = publicationListRequirement
    }
    
    
    @MainActor
    func getPublicationList() async{
        let result = await publicationListRequirement.getPublicationList()

        if let res = result {
            self.publicationList = res.data ?? self.publicationList
            print("ModelView: Received publication data")
        } else {
            print("Failed to fetch publication data")
        }
    }
    
}
