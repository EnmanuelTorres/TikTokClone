//
//  Firestore+Constants.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 29/11/23.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
}
