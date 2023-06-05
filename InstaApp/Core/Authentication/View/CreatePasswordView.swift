//
//  CreatePasswordView.swift
//  InstaApp
//
//  Created by mac24h on 26/05/2023.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack {
            Text("Create a password")
                .font(.title)
                .padding(.bottom, 1)
            
            Text("Your password must be at least 6 characters in length.")
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
            
            SecureField("Enter your password", text: $viewModel.password)
                .autocapitalization(.none)
                .modifier(IATextFieldModifier())
                .padding(.vertical, 20)
            
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            
            Spacer()
            
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
