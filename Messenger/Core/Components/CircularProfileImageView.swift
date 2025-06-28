//
//  CircularProfileImageView.swift
//  Messenger
//
//  Created by Aditya Bhardwaj on 27/06/25.
//

import SwiftUI

enum ProfileImageSize {
    case xxsmall
    case xsmall
    case small
    case medium
    case large
    case xlarge
    
    var dimensions: CGFloat {
        switch self {
        case .xxsmall: return 28
        case .xsmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xlarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = user.profileImageURL {
            Image(imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimensions, height: size.dimensions)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_DATA, size: .xlarge)
}
