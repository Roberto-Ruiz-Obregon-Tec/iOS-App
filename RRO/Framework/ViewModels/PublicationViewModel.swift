//
//  PublicationViewModel.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import Foundation

class PublicationViewModel : ObservableObject { // Inicializamos una clase heredada de ObservableObject
    @Published var publicationList = [Publication]()// Variable a observar
    
    var publicationListRequirement : PublicationListRequirementProtocol
    
    init(publicationListRequirement : PublicationListRequirementProtocol = PublicationListRequirement.shared) {
        self.publicationListRequirement = publicationListRequirement
    }
    
    // Función marcada con @MainActor para obtener la lista de publicaciones de forma asíncrona
    @MainActor
    func getPublicationList() async{
        // Llama a la función en el requisito para obtener la lista de pulicacines de forma asíncrona
        let result = await publicationListRequirement.getPublicationList()
        
        // Comprueba si el ViewModel recibio los datos correctamente
        if let res = result {
            self.publicationList = res.data ?? self.publicationList
            print("ModelView: Received publication data")
        } else {
            print("Failed to fetch publication data")
        }
    }
    
}
