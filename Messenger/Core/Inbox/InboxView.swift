//
//  InboxView.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 26/06/25.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessagesView: Bool = false
    @State private var user: User = User.MOCK_DATA
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                
                List {
                    ForEach(0 ..< 10, id: \.self) { message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
            .fullScreenCover(isPresented: $showNewMessagesView) {
                NewMessageView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xsmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewMessagesView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }

                }
            }
        }
    }
}

#Preview {
    InboxView()
}
