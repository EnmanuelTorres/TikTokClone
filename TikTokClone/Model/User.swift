//
//  User.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 28/11/23.
//

import Foundation

struct User : Identifiable, Codable{
    let id: String
    let username: String
    let email: String
    let fullname: String
    var bio: String?
    var profileImageUrl: String?
}
