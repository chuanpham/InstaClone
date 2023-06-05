//
//  User.swift
//  InstaApp
//
//  Created by mac24h on 26/05/2023.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == self.id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "ChuanPham", profileImageUrl: "avatar", fullname: "Pham Van Chuan", bio: "God Is Good", email: "abc@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ThiCa", profileImageUrl: "avatar", fullname: "Thi Ca Tran Le", bio: "God Is Good", email: "abc@gmail.com"),
    ]
}
