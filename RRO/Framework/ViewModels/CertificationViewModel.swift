//
//  CertificationViewModel.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation

/// ViewModel para gestionar la lista de certificaciones.
///
/// Esta clase se encarga de administrar la lista de certificaciones y proporciona métodos para obtener y actualizar la lista de certificaciones de forma asíncrona.
class CertificationViewModel: ObservableObject {
    /// Lista de certificaciones.
    @Published var certificationList = [Certification]()
    
    /// Requisito para obtener la lista de certificaciones.
    var certificationListRequirement: CertificationListRequirementProtocol
    
    /// Inicializador de CertificationViewModel.
    ///
    /// - Parameters:
    ///   - certificationListRequirement: El requisito para obtener la lista de certificaciones (por defecto, usa CertificationListRequirement.shared).
    init(certificationListRequirement: CertificationListRequirementProtocol = CertificationListRequirement.shared) {
        self.certificationListRequirement = certificationListRequirement
    }
    
    /// Obtiene la lista de certificaciones de forma asíncrona.
    ///
    /// Este método utiliza el requisito especificado para obtener la lista de certificaciones y actualiza la propiedad `certificationList` con los resultados.
    @MainActor
    func getCertificationList() async {
        if let result = await certificationListRequirement.getCertificationList(limit: 32) {
            self.certificationList = result.data ?? self.certificationList
        }
    }
}
