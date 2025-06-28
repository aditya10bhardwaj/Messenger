//
//  RegistrationView.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 26/06/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("messengerLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                VStack {
                    TextField("Full Name", text: $viewModel.fullName)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    TextField("Username", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    SecureField("Password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                Spacer()
                Divider()
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account.")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
