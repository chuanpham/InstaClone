//
//  IATextFieldModifier.swift
//  InstaApp
//
//  Created by mac24h on 26/05/2023.
//

import SwiftUI

struct IATextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
