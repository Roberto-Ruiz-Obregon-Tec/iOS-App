//
//  ProfileView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//  Modified by user326 on 14/11/23.
//  Modified by Azul Rosales on 24/11/23.
//

import SwiftUI

/// View for displayinguser profile information.
struct ProfileView: View {
    
    // MARK: - Properties
    
    // ViewModel for handling profile editing
    @ObservedObject var viewModel: EditProfileViewModel
    
    // ViewModel for handling user logout
    @ObservedObject var logoutViewModel: LogoutViewModel
    
    // ViewModel for managing user's enrolled courses
    @StateObject var myCoursesViewModel = MyCoursesViewModel()
    
    // Callback closure to navigate to the login screen
    let goLogin: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                // User profile image
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                
                // User's full name
                (Text(viewModel.editProfileData.firstName) + Text(" ") + Text(viewModel.editProfileData.lastName))
                    .font(.title)
                    .fontWeight(.bold)
                
                // User's email
                Text(verbatim: viewModel.editProfileData.email)
                    .foregroundStyle(.secondary)
                
                // Navigation link to the profile detail view for editing
                NavigationLink(destination: ProfileDetailView(viewModel: EditProfileViewModel())) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Editar perfil")
                            .padding(4)
                    }
                }
                
                // Logout button
                Button(action: {
                    // Logout action
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
                
                Divider()
                    .padding()
                
                // Section header for displaying enrolled courses
                Text("Mis Cursos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                
                ScrollView {
                    
                    if myCoursesViewModel.courseList.isEmpty {
                        // Message for users with no enrolled courses
                        Text("Actualmente no tienes cursos inscritos")
                            .padding()
                    } else {
                        // Displaying information cards for each enrolled course
                        ForEach(myCoursesViewModel.courseList) { course in
                            MyCourseInfoCardView(course: course)
                        }
                    }
                    
                }.onAppear {
                    // Fetch user profile and enrolled courses on view appearance
                    Task {
                        await viewModel.getEditProfile()
                        await myCoursesViewModel.getMyCourses()
                    }
                }
                
            }
        }
    }
}

