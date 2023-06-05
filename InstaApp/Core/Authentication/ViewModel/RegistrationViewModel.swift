//
//  RegistrationViewModel.swift
//  InstaApp
//
//  Created by mac24h on 30/05/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        // wipe out data after registration process is done
        username = ""
        email = ""
        password = ""
    }
}


