//
//  Post.swift
//  InstaApp
//
//  Created by mac24h on 26/05/2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "My lovely Thi Ca", likes: 30, imageUrl: "avatar", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "My beloved Thi Caaaa", likes: 35, imageUrl: "thica", timestamp: Timestamp(), user: User.MOCK_USERS[1])
    ]
}
