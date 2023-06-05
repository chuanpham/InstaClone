//
//  CreateUsernameView.swift
//  InstaApp
//
//  Created by mac24h on 26/05/2023.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack {
            Text("Create Username")
                .font(.title)
                .padding(.bottom, 1)
            
            Text("Pick a user name for your new account, you can always change it later")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.systemGray))
                .padding(.horizontal)
            
            TextField("Enter your username", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(IATextFieldModifier())
                .padding(.vertical, 20)
            
            NavigationLink {
                CreatePasswordView()
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
