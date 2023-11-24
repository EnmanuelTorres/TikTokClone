//
//  UserCell.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(.systemGray5))
            
            VStack(alignment: .leading){
                Text("test_uset")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("test name")
                    .font(.footnote)
                    
            }
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
