//
//  AvatarView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct AvatarView: View {
    let participant: Participant
    let size: Double
    
    init(participant: Participant, size: Double = 40) {
        self.participant = participant
        self.size = size
    }
    
    var body: some View {
        Group {
            if let url = participant.profileImageLink {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        // Displays the loaded image.
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        // Indicates an error.
                        fallbackToInitials()
                    } else {
                        // Acts as a placeholder.
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(.white)
                            .foregroundStyle(.gray.gradient.opacity(0.5))
                    }
                }
            } else {
                fallbackToInitials()
            }
        }
        .frame(width: size, height: size)
        .background(Color.secondary.gradient)
        .clipShape(Circle())
    }
    
    func fallbackToInitials() -> some View {
        Text(participant.name, format: .name(style: .abbreviated))
            .font(.title2)
            .minimumScaleFactor(0.05)
            .foregroundStyle(.white)
            .padding(2)
    }
}
