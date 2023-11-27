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
            InicioView().tabItem {
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
            ProfileView(logoutViewModel: LogoutViewModel(loginViewModel: LoginViewModel()), loginViewModel: LoginViewModel(), loginRepository: LoginRepository(), goLogin: goLogin).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
        }.onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}

struct MenuViewPreview: PreviewProvider {
    static var previews: some View {
        MenuView{()}
    }
}
