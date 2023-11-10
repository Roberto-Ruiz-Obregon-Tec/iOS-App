//
//  CompanyRequirement.swift
//  RRO
//
//  Created by Erik Cabrera on 06/11/23.
//

import Foundation

protocol CompanyListRequirementProtocol {
    func getCompanyList(limit: Int, offset: Int) async -> ServerResponse<[Company]>?
}

class CompanyListRequirement: CompanyListRequirementProtocol {
let dataRepository: CompanyRepository
static let shared = CompanyListRequirement()

init(dataRepository: CompanyRepository = CompanyRepository.shared) {
    self.dataRepository = dataRepository
}

func getCompanyList(limit: Int, offset: Int) async -> ServerResponse<[Company]>? {
    return await dataRepository.getCompanyList(limit: limit, offset: offset)
}
}
