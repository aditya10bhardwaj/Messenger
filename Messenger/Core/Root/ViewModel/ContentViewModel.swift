//
//  ContentViewModel.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 29/06/25.
//

import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        AuthService().$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)

    }
}
