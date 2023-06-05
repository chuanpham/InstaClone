//
//  SearchViewModel.swift
//  InstaApp
//
//  Created by mac24h on 01/06/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUser() }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        self.users = try await UserService.fetchAllUser()
    }
}
