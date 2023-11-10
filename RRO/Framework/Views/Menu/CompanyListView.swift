//
//  CompanyListView.swift
//  RRO
//
//  Created by Erik Cabrera on 06/11/23.
//

import Foundation
import SwiftUI

struct CompanyListView: View {
    @StateObject var companyViewModel = CompanyViewModel()
    
    var body: some View {
        VStack {
            if companyViewModel.companyList.isEmpty {
                Text("No hay compañías disponibles en este momento")
                    .padding()
            } else {
                ScrollView {
                    ForEach(companyViewModel.companyList) {company in
                        CompanyInfoCardView(company: company)
                    }
                    
                }
            }
        }.onAppear {
            Task {
                await companyViewModel.getCompanies()
            }
        }
    }
}

struct ComapyViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CompanyListView (companyViewModel: getViewModel())
        }
    }
    
    static var elems = 10
    static func getViewModel() -> CompanyViewModel {
        let vm = CompanyViewModel()
        for _ in 1...elems {
            vm.companyList.append(
                Company(id: UUID().uuidString, postalCode: "CP", name: "Empresa", description: "Descripción", phone: "Teléfono", certifications: [])
            )
        }
        return vm
    }
}
