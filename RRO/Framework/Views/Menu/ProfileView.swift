//
//  ProfileView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//  Modified by user326 on 14/11/23.
//  Modified by Azul Rosales on 24/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var myCoursesViewModel = MyCoursesViewModel()
    
    @ObservedObject var viewModel: EditProfileViewModel
    @ObservedObject var logoutViewModel: LogoutViewModel
    
    let goLogin: () -> Void
    
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .fontWeight(.light)
                                    .foregroundColor(.secondary)
                
                (Text(viewModel.editProfileData.firstName) + Text(" ") + Text(viewModel.editProfileData.lastName))
                    .font(.title)
                    .fontWeight(.bold)
                            
                Text(verbatim: viewModel.editProfileData.email
                )
                    .foregroundStyle(.secondary)
                
                NavigationLink(destination: ProfileDetailView(viewModel: EditProfileViewModel())) {
                    HStack{
                        Image(systemName: "pencil")
                        Text("Editar perfil")
                            .padding(4)
                    }
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
                        await viewModel.getEditProfile()
                        await myCoursesViewModel.getMyCourses() // Llama al método
                    }
                }
                
                
                Button(action: {
                    // Realiza el cierre de sesión
                    logoutViewModel.getLogout()
                    goLogin()
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(Color.red)
                    Text("Cerrar sesión")
                        .foregroundColor(Color.red)
                        .cornerRadius(20)
                        .font(.headline)
                        .padding(2)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let editProfileViewModel = EditProfileViewModel()
        let logoutViewModel = LogoutViewModel(loginViewModel: LoginViewModel())
        
        ProfileView(viewModel: editProfileViewModel, logoutViewModel: logoutViewModel, goLogin: {})
            .environmentObject(MyCoursesViewModel())
    }
}
