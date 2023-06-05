//
//  AddEmailView.swift
//  InstaApp
//
//  Created by mac24h on 24/05/2023.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack {
            Text("Add your email")
                .font(.title)
                .padding(.bottom, 1)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
            
            TextField("Enter your email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(IATextFieldModifier())
                .padding(.vertical, 20)
            
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
