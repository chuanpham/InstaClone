//
//  UserService.swift
//  InstaApp
//
//  Created by mac24h on 01/06/2023.
//

import Foundation
import Firebase

struct UserService {
    
    @MainActor
    static func fetchAllUser() async throws -> [User] {
        // old way
//        var users = [User]()
//        let snapshot = try await Firestore.firestore().collection("user").getDocuments()
//        for doc in snapshot.documents {
//            guard let user = try? doc.data(as: User.self) else { return users }
//            users.append(user)
//        }
//        return users
        
        // new way
        let snapshot = try await Firestore.firestore().collection("user").getDocuments()
        return snapshot.documents.compactMap( { try? $0.data(as: User.self) } )
    }
}
