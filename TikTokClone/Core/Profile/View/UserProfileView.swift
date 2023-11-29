//
//  UserProfileView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 29/11/23.
//

import SwiftUI

struct UserProfileView: View {
    
    let user: User
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                //profile header
                ProfileHeaderView(user: user)
                
                //post grid view
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
