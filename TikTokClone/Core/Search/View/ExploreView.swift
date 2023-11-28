//
//  ExploreView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel(userService: MockUserService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        UserCell(user: user)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
        
    }
}

#Preview {
    ExploreView()
}
