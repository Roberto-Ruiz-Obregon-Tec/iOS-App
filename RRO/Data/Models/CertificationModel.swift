//
//  CertificationModel.swift
//  RRO
//
//  Creado por Sebastian Jimenez Bauer el 30/10/23.
//

import Foundation

/// Modelo para representar una certificación.
///
/// Esta estructura contiene los detalles de una certificación, incluyendo su identificador, nombre, descripción y fecha de adquisición (si está disponible).
struct Certification: Codable, Identifiable {
    /// El identificador único de la certificación.
    var id: String
    /// El nombre de la certificación.
    var name: String
    /// La descripción de la certificación.
    var description: String
    /// La fecha en que se adquirió la certificación (opcional).
    var adquisitionDate: String?
    
    /// Define mapeo de claves para la codificación y decodificación de propiedades.
    enum CodingKeys: String, CodingKey {
        case id = "_id" // Mapea la propiedad 'id' a '_id' en el JSON
        case name, description, adquisitionDate // Actualiza los nombres de las claves para que coincidan con las claves del JSON
    }
}


/// Response de Struct Certification
struct CertificationResponse<T: Codable>: Codable {
    /// El estado de la respuesta.
    var status: String
    /// El número de resultados (opcional).
    var results: Int?
    /// Los datos de la respuesta.
    var data: Data
    
    /// Los datos que contienen un array de documentos de certificación.
    struct Data: Codable {
        /// Un array de certificaciones.
        var documents: [Certification]
    }
}

