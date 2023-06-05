//
//  FeedCell.swift
//  InstaApp
//
//  Created by mac24h on 19/05/2023.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user   {
                    CircularProfileImageView(user: user, size: .small)
                    
                    Text(user.username)
                        .font(.footnote).fontWeight(.semibold)
                }
                Spacer()
            }.padding(.leading)
            
            // post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 270)
                .clipShape(Rectangle())
            
            // action button
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 5)
            
            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 2)
            
            // caption label
            HStack {
                Text("\(post.user?.username ?? "") ")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                Text(post.caption)
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top, 1)
            
            // time label
            Text("6 hours ago")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)

        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[1])
    }
}
