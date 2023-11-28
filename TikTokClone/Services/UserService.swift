//
//  UserService.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 28/11/23.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

struct UserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
            
        } catch {
            throw error
        }
    }
}
