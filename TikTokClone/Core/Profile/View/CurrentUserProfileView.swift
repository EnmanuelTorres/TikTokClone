//
//  CurrentUserProfileView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
     let authService: AuthService
     let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    //profile header
                    ProfileHeaderView(user: user)
                    
                    //post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sing out") {
                        authService.signout()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(userService: UserService(),
                                                    uploadUserService: UploadUserService()), 
                           user: DeveloperPreview.user)
}
