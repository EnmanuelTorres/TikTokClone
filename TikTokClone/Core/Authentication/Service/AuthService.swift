//
//  AuthService.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    func updatedUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email \(email)")
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullName: String) async throws {
       
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: user is \(result.user.uid)")
        }catch {
            print("DEBUG: failes to create user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout(){
        
    }
}
