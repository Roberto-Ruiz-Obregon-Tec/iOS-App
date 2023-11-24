//
//  ProfileView.swift
//  RRO
//
//  Modified by user326 on 14/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var myCoursesViewModel = MyCoursesViewModel() // Se crea una instancia del ViewModel
    
    @ObservedObject var logoutViewModel: LogoutViewModel
    let goLogin: () -> Void
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Image(systemName: "person")
                        .font(.largeTitle)
                    
                    Text("Perfil")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                NavigationLink(destination: ProfileDetailView(viewModel: EditProfileViewModel())) {
                    Text("Editar perfil")
                        .padding()
                }
                
                Text("Mis Cursos")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                ScrollView {
                    
                    if (myCoursesViewModel.courseList.count == 0){
                        Text("Actualmente no tienes cursos inscritos")
                            .padding()
                    }
                    else{
                        
                        ForEach(myCoursesViewModel.courseList) { course in
                            MyCourseInfoCardView(course: course) // Muestra una tarjeta de información del curso
                        }
                    }
                    
                }.onAppear {
                    Task {
                        await myCoursesViewModel.getMyCourses() // Llama al método
                    }
                }
                
                
                Button(action: {
                    // Realiza el cierre de sesión
                    logoutViewModel.getLogout()
                    goLogin()
                }) {
                    Text("Cerrar sesión")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .font(.headline)
                }
            }
        }
    }
}

struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        // Asegúrate de crear instancias válidas de LogoutViewModel y LoginViewModel
        let logoutViewModel = LogoutViewModel(loginViewModel: LoginViewModel())
    }
}
