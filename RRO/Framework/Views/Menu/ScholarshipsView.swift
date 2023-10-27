//
//  ScholarshipsView.swift
//  RRO
//
//  Created by peblo on 25/10/23.
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
                    List(scholarshipViewModel.scholarshipList) { scholarship in
                        NavigationLink {
                            ScholarshipDetailView(scholarship: scholarship)
                        } label: {
                            Text(scholarship.name)
                        }.padding()
                    }
                }
            }.onAppear {
                Task {
                    await scholarshipViewModel.getScholarsipList()
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
                    id: UUID().uuidString,
                    name: "Preview Scholarship \(i)",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.",
                    organization: "Lorem",
                    location: "Ipsum",
                    email: "LoremIpsum@email.com",
                    phone: "123456789",
                    image: "",
                    sector: "Lorem",
                    startDate: Date.now,
                    endDate: Date.now
                )
            )
        }
        
        return vm
    }
}


