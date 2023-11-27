//
//  LoginViewModel.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import Foundation

class LoginViewModel : ObservableObject {
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do{
            try await authService.login(withEmail: email, password: password)
        }catch {
            print("DEBUG: did fail to log in with error: \(error.localizedDescription)")
        }
    }
    
}
