//
//  EditProfileViewModel.swift
//  InstaApp
//
//  Created by mac24h on 01/06/2023.
//

import SwiftUI
import PhotosUI
import Firebase

class EditProfileViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    @Published var user: User
    
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        // update profile image if changed
        if let uiImage = uiImage {
            let imgUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imgUrl
        }
      
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        //update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("user").document(user.id).updateData(data)
        }
        
    }
}
