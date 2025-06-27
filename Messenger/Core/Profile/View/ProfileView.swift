//
//  ProfileView.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 27/06/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    PhotosPicker(selection: $viewModel.selectedItem) {
                        if let profileImage = viewModel.profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color(.systemGray4))
                        }
                    }
                    
                    Text("Aditya Bhardwaj")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                List {
                    Section {
                        ForEach(SettingsOptionsViewModel.allCases) { option in
                            HStack {
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(option.imageBackgroundColor)
                                
                                Text(option.title)
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                    Section {
                        Button("Log Out") {
                            
                        }
                        
                        Button("Delete Account") {
                            
                        }
                    }
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
