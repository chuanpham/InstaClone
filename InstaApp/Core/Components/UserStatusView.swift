//
//  UserStatusView.swift
//  InstaApp
//
//  Created by mac24h on 18/05/2023.
//

import SwiftUI

struct UserStatusView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
             Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct UserStatusView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatusView(value: 10, title: "test")
    }
}
