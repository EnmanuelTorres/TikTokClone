//
//  ExploreView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel(userService: MockUserService())
    
    private var uploadUserService : UploadUserService
    
    init(uploadUserService : UploadUserService) {
        self.uploadUserService = uploadUserService
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
        
    }
}

#Preview {
    ExploreView(uploadUserService: UploadUserService())
}
