//
//  PublicationView.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import SwiftUI

struct PublicationView: View {
    @StateObject var publicationViewModel = PublicationViewModel()
    
    
    var body: some View {
        VStack {
            if publicationViewModel.publicationList.isEmpty {
                Spacer()
                Text("No hay publicaciones disponibles")
                Spacer()
            } else {
                ScrollView {
                    ForEach(publicationViewModel.publicationList){publication in
                            PublicationCardView(publication: publication)
                    }
                    }
                }
            } .onAppear{
                Task {
                    await publicationViewModel.getPublicationList()
                }
        }
    }
    
    struct PublicationView_Previews: PreviewProvider {
        static var previews: some View {
            PublicationView()
        }
    }
    
}
