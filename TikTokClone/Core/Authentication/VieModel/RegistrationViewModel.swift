//
//  RegistrationViewModel.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    
    
    func createUser(withEmail email: String, password: String, username: String, fullName: String) async {
        do{
            try await authService.createUser(withEmail: email,
                                             password: password,
                                             username: username,
                                             fullName: fullName)
        }catch {
            print("DEBUG: did fail to log in with error: \(error.localizedDescription)")
        }
    }
}
