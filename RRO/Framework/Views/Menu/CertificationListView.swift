//
//  CursosView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 26/10/23.
//

import SwiftUI

/// Agregar Vista certificaciones
struct CertificationListView: View {
    @StateObject var certificationViewModel = CertificationViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(certificationViewModel.certificationList) { certification in
                CertificationInfoCardView(name: certification.name, description: certification.description)
            }
        }
        .padding(.horizontal)
        .onAppear {
            Task {
                await certificationViewModel.getCertificationList()
            }
        }
        
        if certificationViewModel.certificationList.isEmpty {
            Text("No hay Acreditaciones disponibles en este momento")
                .padding()
        }
    }
}

struct CertificationListView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationListView()
    }
}



