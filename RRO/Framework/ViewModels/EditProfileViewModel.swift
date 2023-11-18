//
//  EditProfileViewModel.swift
//  RRO
//
//  Created by Amy Gregg on 11/17/23.
//
import Foundation

enum EditProfileState {
    case success
    case error
}

class EditProfileViewModel: ObservableObject {
    @Published var editProfileData: User
//    @Published var user = User(id: UUID().uuidString, firstName: "Amy", lastName: "Gregg", age: 20, gender: "Mujer", email: "teehee@gmail.com", occupation: "Student", company: "University of Oregon", postalCode: 97068)
    @Published var cp: String
    @Published var age: String
    
    @Published var errorTitle: String
    @Published var errorMessage: String
    @Published var showAlert: Bool
    
    
    private var editProfileRequirement: EditProfileRequirementProtocol
    
    init( editProfileRequirement: EditProfileRequirementProtocol = EditProfileRequirement.shared) {
        self.editProfileData = User(id: "", firstName: "Amy", lastName: "Gregg", age: 20, gender: "Mujer", email: "teehee@gmail.com", occupation: "Student", company: "University of Oregon", sociallyResponsibleCompany: false, postalCode: 97068, profilePicture: "")
        self.cp = ""
        self.age = ""
        
        self.errorTitle = ""
        self.errorMessage = ""
        self.showAlert = false
        self.editProfileRequirement = editProfileRequirement
    }
    
    @MainActor
    func postEditProfile() async -> EditProfileState {
        self.editProfileData.postalCode = Int(self.cp) ?? 0
        self.editProfileData.age = Int(self.age) ?? 0
        
        guard let response = await editProfileRequirement.postEditProfile(model: editProfileData) else {
            self.errorTitle = "Error con el servidor"
            self.errorMessage = "Vuelve a intentar ingresar o inténtalo más tarde."
            self.showAlert = true
            return .error
        }
        //print("Hola")
        guard let token = response.token else {
            self.errorTitle = "Error"
            //print("amor")
            self.errorMessage = response.message ?? "..."
            self.showAlert = true
            //print("Mama")
            return .error
        }
        //print("lol")
        LocalService.shared.setCurrentSession(token: token)
        return .success
        
    }
}
