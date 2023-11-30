//
//  ContentViewModel.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel : ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let authService: AuthService
    private let userService: UserService
    private var cancellables = Set<AnyCancellable>()
    
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        setupSubscribers()
        authService.updatedUserSession()
       
    }
    
    private func setupSubscribers() {
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser(){
        guard userService != nil else {
            return
        }
        
        Task {
            self.currentUser = try await userService.fetchCurrentUser()
        }
    }
}
