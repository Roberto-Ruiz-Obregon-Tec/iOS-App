//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import SwiftUI


/// Defines a view (CertificationListView) in the "RRO" app to display a list of certifications
struct CertificationListView: View {
    @StateObject var certificationViewModel = CertificationViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(certificationViewModel.certificationList) { certification in
                    CertificationInfoCardView(name: certification.name, description: certification.description)
                }
            }
            .onAppear {
                Task {
                    await certificationViewModel.getCertificationList()
                }
            }
        }
    }
}

struct CertificationListView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationListView()
    }
}



