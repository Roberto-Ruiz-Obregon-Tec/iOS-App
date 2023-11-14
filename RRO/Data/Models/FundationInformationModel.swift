//
//  FundationInformationModel.swift
//  RRO
//
//  Created by Mauricio Garcia Villanueva on 29/10/23.
//

import Foundation

/// Defines a  data model (InfoFundation) for foundation information in the "RRO" app.
struct InfoFundation: Codable, Identifiable {
    var id: String
    var name: String
    var email: String
    var phone: String
    var description: String
    var location: String
    var facebook: String
    var twitter: String
    var instagram: String
    var tiktok: String
 
}






