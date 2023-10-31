//
//  CoordinatorView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import FlowStacks

struct CoordinatorView: View {
    @State private var routes: Routes<Screen> = [.root(.login)]
    
    enum Screen {
        case login
        case register
        case restore
        case menu
    }
    
    var body: some View {
        Router($routes) { screen, _ in
            switch screen {
            case .login:
                LoginView(goMenu: {
                    routes.presentCover(.menu)
                }, goRegister: {
                    routes.presentSheet(.register)
                }, goRestore: {
                    routes.presentSheet(.restore)
                })
                
            case .register:
                SigninView(goMenu: { routes.presentCover(.menu) })
                
            case .restore:
                RestoreView(goLogin: { routes.goBack() })
                
            case .menu:
                MenuView(goLogin: { routes.presentCover(.login) })
            }
        }
    }
    
    private func goRoot() {
        Task { @MainActor in
            await $routes.withDelaysIfUnsupported {
                $0.goBackToRoot()
            }
        }
    }
}
