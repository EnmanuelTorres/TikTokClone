//
//  FeedCell.swift
//  TikTokClone
//
//  Created by ENMANUEL TORRES on 24/11/23.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                 .containerRelativeFrame([.horizontal, .vertical])
                
            
            VStack{
                Spacer()
                
                HStack(alignment: .bottom) {
                    
                    VStack(alignment: .leading) {
                        Text("yolima.torres")
                            .fontWeight(.semibold)
                            
                        
                        Text("rocket prepare for takeoff!!")
                    }
                    .foregroundStyle(.white)
                    .font(.headline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        
                        Circle()
                            .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Button{
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                     .resizable()
                                     .frame(width: 28, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                     .foregroundStyle(.white)
                                     .bold()
                                
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        Button{
                            
                        } label: {
                           
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                     .resizable()
                                     .frame(width: 28, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                     .foregroundStyle(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            
                        }
                        
                        Button{
                            
                        } label: {
                           Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                        }
                        
                        Button{
                            
                        } label: {
                           Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                        }
                    }
                    
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
                
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
       
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, VideoUrl: ""), player: AVPlayer())
}
