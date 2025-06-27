//
//  User.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 27/06/25.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    let profileImageURL: String?
}

extension User {
    static let MOCK_DATA = User(fullName: "Bruce Wayne", email: "test@gmail.com", profileImageURL: "batman")
}
