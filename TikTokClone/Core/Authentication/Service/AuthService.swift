//
//  AuthService.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import Foundation
import Firebase

class AuthService {
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email \(email)")
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullName: String) async throws {
        print("DEBUG: create with email \(email)")
    }
    
    func signout(){
        
    }
}
