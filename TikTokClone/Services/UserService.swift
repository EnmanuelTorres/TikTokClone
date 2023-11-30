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
    
    func fetchCurrentUser() async throws -> User? {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return nil
        }
        let currentUser = try await FirestoreConstants.UsersCollection.document(currentUid).getDocument(as: User.self)
        
        print("DEBUG: current user is \(currentUser)")
        return currentUser
    }

    
    func fetchUsers() async throws -> [User] {
        let snapshot = try await FirestoreConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self ) })
    }
}

struct UploadUserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            
            let userData = try Firestore.Encoder().encode(user)
            try await FirestoreConstants.UsersCollection.document(user.id).setData(userData)
            
        } catch {
            throw error
        }
    }
}
