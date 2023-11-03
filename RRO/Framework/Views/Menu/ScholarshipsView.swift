//
//  ScholarshipsView.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//  Edited by Amy Gregg on 31/10/23.
//

import SwiftUI

struct ScholarshipsView: View {
    @StateObject var scholarshipViewModel = ScholarshipViewModel()

    var body: some View {
        // TODO: Reload scrolling up
        VStack {
            NavigationStack {
                if scholarshipViewModel.scholarshipList.isEmpty {
                    // TODO: No scholarships found message
                    // TODO: Notify network error
                    // TODO: Loading view
                    Text("No hay becas disponibles en este momento")
                        .padding()
                } else {
                    ScrollView {
                        ForEach(scholarshipViewModel.scholarshipList) {
                            scholarship in ScholarshipInfoCardView(scholarship: scholarship)
                        }
                        .padding(.horizontal)
                        .onAppear {
                            Task {
                                await scholarshipViewModel.getScholarsipList()
                            }
                        }
                    }
                }
            }
        }
    }
}

/// Preview with dummy data to preview the scholarship list
struct ScholarshipsViewPreviews: PreviewProvider {
    static var previews: some View {
        ScholarshipsView (scholarshipViewModel: getViewModel())
    }
    
    /// If there is no backend the preview will generate this ammount of card elements
    static var elems = 10
    static func getViewModel() -> ScholarshipViewModel {
        let vm = ScholarshipViewModel()
        for i in 1...elems {
            vm.scholarshipList.append(
                Scholarship(
                    id:UUID().uuidString,
                    name: "Beca \(i)",
                    description: "Descripción del beca",
                    organization: "University of Oregon",
                    location: "Oregon, EE.UU.",
                    email: "robertoruiz@gmail.com",
                    phone: "123-456-7890",
                    image: "",
                    sector: "smth",
                    startDate: Date.now,
                    endDate: Date.now)
                )
        }
        
        return vm
    }
}
