//
//  LoginViewModel.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 29/06/25.
//

import Foundation

class LoginViewModel:ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
