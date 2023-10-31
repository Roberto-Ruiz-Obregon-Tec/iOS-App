//
//  MenuView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI

struct MenuView: View {
    let goLogin: () -> Void
    var body: some View {
        TabView {
            // TODO: wrap courses, scholarships, and programs on a single view
            ScholarshipsView().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }
            FeedView().tabItem {
                Image(systemName: "globe")
                Text("Publicaciones")
            }
            FAQView().tabItem {
                Image(systemName: "envelope")
                Text("FRRO")
            }
            ProfileView(goLogin: goLogin).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
        }
    }
}
