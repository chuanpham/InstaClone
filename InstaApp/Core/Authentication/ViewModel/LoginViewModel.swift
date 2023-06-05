//
//  LoginViewModel.swift
//  InstaApp
//
//  Created by mac24h on 31/05/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
