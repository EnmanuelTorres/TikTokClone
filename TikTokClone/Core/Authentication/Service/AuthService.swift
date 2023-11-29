//
//  AuthService.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    private let userService : UserServiceProtocol
    public let uploadUserService: UploadUserService
    
    init(userService : UserServiceProtocol, uploadUserService: UploadUserService) {
        self.userService = userService
        self.uploadUserService = uploadUserService
    }
    
    func updatedUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: user is \(result.user.uid)")
        }catch {
            print("DEBUG: failed to sign user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullName: String) async throws {
       
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            try await uploadUserData(withEmail: email,
                                id: result.user.uid,
                                username: username,
                                fullName: fullName)
        }catch {
            print("DEBUG: failed to create user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout(){
        try? Auth.auth().signOut() // sings user out on backend
        self.userSession = nil // updates routing logic by wiping user session
    }
    
    private func uploadUserData (withEmail email: String,
                                  id: String,
                                  username: String,
                                 fullName: String) async throws {
        
        let user = User(id: id,
                        username: username,
                        email: email,
                        fullname: fullName)
        
     try await uploadUserService.uploadUserData(user)
     
    }
}
