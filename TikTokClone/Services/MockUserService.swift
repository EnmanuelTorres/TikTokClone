//
//  MockUserService.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 28/11/23.
//

import Foundation


struct MockUserService: UserServiceProtocol {
    func fetchUsers() async throws -> [User] {
        return DeveloperPreview.users
    }
    
    
}
