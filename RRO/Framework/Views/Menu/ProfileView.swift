//
//  ProfileView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//  Modified by Azul Rosales on 15/11/23.
//  Modified by user326 on 14/11/23.

import SwiftUI


struct ProfileView: View {
    
    @StateObject var myCoursesViewModel = MyCoursesViewModel() // Se crea una instancia del ViewModel
    
    @ObservedObject var logoutViewModel: LogoutViewModel
    @ObservedObject var loginViewModel: LoginViewModel
    
    let loginRepository: LoginRepository

    let goLogin: () -> Void
    
    //@State private var user: User
    
    let dummyEvent = Event(
        id: UUID().uuidString,
        eventName: "Dummy Event",
        description: "This is a dummy event description. Lorem ipsum dolor sit amet.",
        location: "Dummy Location",
        startDate: Date().toString(), // Replace with a valid date
        endDate: Date().toString(),   // Replace with a valid date
        imageUrl: "dummy_image_url"   // Replace with a valid image URL
    )
    
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                                
                (Text("Azul") + Text(" ") + Text("Rosales"))
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(verbatim: "azul@rosales.com")
                    .foregroundStyle(.secondary)
                
                NavigationLink(destination: EventDetailView(event: dummyEvent)) {
                    Text("Mis Cursos")
                        .font(.headline)
                        .frame(maxWidth: 200)
                        .padding(4)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .foregroundStyle(Color.white)
                .padding(10)
                
                Divider()
                    .padding()
                
                NavigationLink(destination: ProfileDetailView()) {
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

            }.task{
                let result = await loginViewModel.postLogin()
                
                print(LoginState.success)
                //print(LocalService.shared.setCurrentSession(token: token))
                let response = await loginRepository.postLogin(model: loginViewModel.loginInfo)
                print(response)
                
            }
        }
    }
}

/*
struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        // Asegúrate de crear instancias válidas de LogoutViewModel y LoginViewModel
        let logoutViewModel = LogoutViewModel(loginViewModel: LoginViewModel())
        let goLogin: () -> Void = {
                    // TODO: Implement the logic for going to the login screen
                }
        ProfileView(logoutViewModel: logoutViewModel, goLogin: goLogin)
    }
}
*/
