//
//  ChatView.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 27/06/25.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: User.MOCK_DATA, size: .xlarge)
                    
                    VStack(spacing: 4) {
                        Text(User.MOCK_DATA.fullName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    
                    ForEach(0 ... 15, id: \.self) { message in
                        ChatMessageCell(isFromCurrentUser: Bool.random())
                    }
                }
            }
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .font(.subheadline)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                
                Button {
                    
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView()
}
