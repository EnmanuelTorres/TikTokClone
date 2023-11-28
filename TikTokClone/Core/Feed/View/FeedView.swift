//
//  FeedView.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI
import AVKit

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear{
                            playInitialVideoIfNecessary()
                            
                                    if player.timeControlStatus == .paused {
                                        player.play()
                                    }
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
          playVideoOnChangeOfScrollPosition(postId: newValue)
        }
        .onDisappear{
            player.pause()
        }
    }
    
    func playInitialVideoIfNecessary(){
        guard scrollPosition == nil, let FirstPost = viewModel.posts.first else {
            return
        }
        
        let item = AVPlayerItem(url: URL(string: FirstPost.VideoUrl)! )
        player.replaceCurrentItem(with: item)
        player.play()
        
      
        
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId } ) else {
            return

        }
        
        player.replaceCurrentItem(with: nil)
        
        if player.timeControlStatus == .paused {
            player.play()
        }
            
        
        let playerItem = AVPlayerItem(url: URL(string: currentPost.VideoUrl)!)
        
        player.replaceCurrentItem(with: playerItem)
        
    }
}

#Preview {
    FeedView()
}
