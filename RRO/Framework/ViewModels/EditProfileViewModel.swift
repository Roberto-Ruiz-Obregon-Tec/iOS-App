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
    
    @Published var cp: String
    @Published var age: String
    
    @Published var errorTitle: String
    @Published var errorMessage: String
    @Published var showAlert: Bool
    
    
    private var editProfileRequirement: EditProfileRequirementProtocol
    
    init( editProfileRequirement: EditProfileRequirementProtocol = EditProfileRequirement.shared) {
        self.editProfileData = User(id: UUID().uuidString, firstName: "", lastName: "", age: 0, gender: "", email: "", occupation: "", company: "", postalCode: 0)
        self.cp = ""
        self.age = ""
        
        self.errorTitle = ""
        self.errorMessage = ""
        self.showAlert = false
        self.editProfileRequirement = editProfileRequirement
    }
    
    @MainActor
    func getEditProfile() async {
        
        let response = await editProfileRequirement.getEditProfile()
        guard let user = response?.data else { return }
        self.editProfileData = user
        
        self.age = String(self.editProfileData.age)
        self.cp = String(self.editProfileData.postalCode)
    }
    
    @MainActor
    func patchProfile() async -> EditProfileState {
        self.editProfileData.postalCode = Int(self.cp) ?? 0
        self.editProfileData.age = Int(self.age) ?? 0
        
        if isFormIncomplete() {
            if editProfileData.age >= 112 || editProfileData.age <= 0 {
                self.errorTitle = "Edad"
                self.errorMessage = "Su edad no es válida."
                self.showAlert = true
            }
            
            else if editProfileData.postalCode <= 9999 || editProfileData.postalCode >= 100000 {
                self.errorTitle = "Código Postal"
                self.errorMessage = "Su código postal no es válido."
                self.showAlert = true
            }
            
            else  {
                self.errorTitle = "Campos vacíos"
                self.errorMessage = "Por favor, completa todos los campos."
                self.showAlert = true
            }
            
            let response = await editProfileRequirement.getEditProfile()
            guard let user = response?.data else { return .error }
            self.editProfileData = user
            return .error
        }
        
        guard let _ = await editProfileRequirement.patchProfile(model: editProfileData) else {
            self.errorTitle = "Error con el servidor"
            self.errorMessage = "Vuelve a intentar ingresar o inténtalo más tarde."
            self.showAlert = true
            let response = await editProfileRequirement.getEditProfile()
            guard let user = response?.data else { return .error }
            self.editProfileData = user
            return .error
        }
        
        self.errorTitle = "Éxito"
        self.errorMessage = "Tú información se actualizó correctamente."
        self.showAlert = true
        return .success
    }
    
    func isFormIncomplete() -> Bool {
        return editProfileData.firstName.isEmpty  ||
        editProfileData.lastName.isEmpty   ||
        editProfileData.age <= 0           ||
        editProfileData.gender.isEmpty     ||
        editProfileData.postalCode <= 9999 ||
        editProfileData.postalCode >= 100000 ||
        editProfileData.age >= 112
    }
}
