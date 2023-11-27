//
//  StandardTextFieldModifier.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 27/11/23.
//


import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
    
    
}
