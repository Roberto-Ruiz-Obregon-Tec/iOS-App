//
//  CoordinatorView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import FlowStacks

struct CoordinatorView: View {
    @State private var routes: Routes<Screen> = [.root(
        LocalService.shared.getCurrentSession() != nil ? .menu : .login
    )]
    
    enum Screen {
        case login
        case register
        case restore
        case menu
    }
    
    var body: some View {
        NavigationView{
            Router($routes) { screen, _ in
                switch screen {
                case .login:
                    LoginView(viewModel: LoginViewModel(), goMenu: {
                        routes.presentCover(.menu)
                    }, goRegister: {
                        routes.presentSheet(.register)
                    }, goRestore: {
                        routes.presentSheet(.restore)
                    })
                    
                case .register:
                    SigninView(viewModel: SigninViewModel(), goMenu: { routes.presentCover(.menu) })
                    
                case .restore:
                    RestoreView(goLogin: { routes.goBack() })
                    
                case .menu:
                    MenuView(goLogin: { routes.presentCover(.login) })
                }
            }.onAppear {
                if LocalService.shared.getCurrentSession() != nil {
                    routes.presentCover(.menu)
                }
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


struct CoordinatorViewPreview: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}

