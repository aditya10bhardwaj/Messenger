//
//  RegistrationViewModel.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 29/06/25.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    
    func createUser() async throws {
        try await AuthService().createUser(withEmail: email, password: password, fullName: fullName)
    }
}
