//
//  ReviewView.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI

struct Post {
    let id: Int
    let profileImage: String
    let username: String
    let timeAgo: String
    let content: String
    let images: [String]
    let replies: Int
    let views: Int
}

struct ReviewView: View {
    
    let posts: [Post] = [
        Post(
            id: 1,
            profileImage: "Willy",
            username: "Willy Edmond",
            timeAgo: "15 minutes ago",
            content: "I finished crafting my coffee table. The Library of Babel was my favourite theme. It is worth to create this. I hope you’ll do same.",
            images: ["tablebabel"],
            replies: 15,
            views: 2012
        ),
        Post(
            id: 2,
            profileImage: "maria",
            username: "Maria Johnson",
            timeAgo: "30 minutes ago",
            content: "I reused plastic bottles for planting. Really fascinating.",
            images: ["potmaria"],
            replies: 20,
            views: 10325
        )
    ]
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(posts, id: \.id) { post in
                PostCard(post: post)
                
            }
        }
    }
}

struct PostCard: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Image(post.profileImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(post.username)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(post.timeAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    print("Options tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
            
            // Content
            Text(post.content)
                .font(.body)
                .foregroundColor(.black)
            
            
            if !post.images.isEmpty {
                PostImageGrid(images: post.images)
            }
            
            
            HStack {
                HStack {
                    Image(systemName: "bubble.left")
                    Text("\(post.replies) replies")
                }
                Spacer()
                HStack {
                    Image(systemName: "eye")
                    Text("\(post.views) views")
                }
            }
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

struct PostImageGrid: View {
    let images: [String]
    
    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(images.prefix(4), id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ReviewView()
}

