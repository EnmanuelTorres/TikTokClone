//
//  PreviewProvider.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 28/11/23.
//

import Foundation


struct DeveloperPreview {
    
    static var user = User(id: NSUUID().uuidString,
                           username: "lewis.hamilton",
                           email: "lewis@gmail.com",
                           fullname: "lewis hamilton")
    
    static var users: [User] = [
    
        .init(id: NSUUID().uuidString, username: "lewis.hamilton", email: "lewis@gmail.com", fullname: "lewis hamilton"),
        .init(id: NSUUID().uuidString, username: "max.perez", email: "max@gmail.com", fullname: "max perez"),
        .init(id: NSUUID().uuidString, username: "fernando.smith", email: "fernando@gmail.com", fullname: "fernando smith"),
        .init(id: NSUUID().uuidString, username: "charles.lecter", email: "charls@gmail.com", fullname: "charles lectter")
    
    ]
}
