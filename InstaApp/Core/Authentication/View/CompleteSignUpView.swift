//
//  CompleteSignUpView.swift
//  InstaApp
//
//  Created by mac24h on 26/05/2023.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack {
            Text("Welcome to InstaApp, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start\nusing InstaApp")
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
                .multilineTextAlignment(.center)
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
