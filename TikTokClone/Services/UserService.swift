//
//  UserService.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 28/11/23.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

protocol UserServiceProtocol {
    func fetchUsers() async throws -> [User]
  
}

struct UserService: UserServiceProtocol {

    
    func fetchUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self ) })
    }
}

struct UploadUserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
            
        } catch {
            throw error
        }
    }
}
