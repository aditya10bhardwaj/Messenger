//
//  AuthService.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 29/06/25.
//

import Foundation
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: current user: \(userSession!)")
    }
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login user with email: \(email)")
        print("DEBUG: Login user with password: \(password)")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User created with id: \(result.user.uid)")
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
