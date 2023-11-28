//
//  ContentView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel(authService: AuthService())
    
    var body: some View {
       Group {
            if viewModel.userSession != nil {
                MainTabView()
            }else {
                LoginView()
            }
       }
    }
}

#Preview {
    ContentView()
}
