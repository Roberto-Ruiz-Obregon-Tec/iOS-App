//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import SwiftUI

struct CertificationListView: View {
    @StateObject var certificationViewModel = CertificationViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(certificationViewModel.certificationList) { certification in
                CertificationInfoCardView(name: certification.name, description: certification.description, goDetail: {})
            }
        }
        .padding(.horizontal)
        .onAppear {
            Task {
                await certificationViewModel.getCertificationList()
            }
        }
    }
}

struct CertificationListView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationListView()
    }
}



