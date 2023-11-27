//
//  FeedViewModel.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
     let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
    ]
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, VideoUrl: videoUrls[0]),
            .init(id: NSUUID().uuidString, VideoUrl: videoUrls[1]),
            .init(id: NSUUID().uuidString, VideoUrl: videoUrls[2]),
            .init(id: NSUUID().uuidString, VideoUrl: videoUrls[3])
        ]
    }
}
