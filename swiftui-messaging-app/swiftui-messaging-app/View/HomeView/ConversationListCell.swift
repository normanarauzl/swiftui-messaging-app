//
//  ConversationListCell.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct ConversationListCell: View {
    let conversation: Conversation
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        HStack {
            if dynamicTypeSize < .accessibility1 {
                Circle()
                    .fill(conversation.isRead ? .clear : .blue)
                    .frame(width: 10, height: 10)
                if let participant = conversation.firstParticipantNotIncludingCurrentUser {
                    AvatarView(participant: participant, size: 50)
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    if dynamicTypeSize >= .accessibility1 && !conversation.isRead {
                        Circle()
                            .fill(.blue)
                            .frame(width: 20, height: 20)
                    }
                    
                    conversation.formatConversationName
                        .font(.headline)
                        .lineLimit(dynamicTypeSize >= .accessibility1 ? 2 : 1)
                    
                    Spacer()
                    
                    if dynamicTypeSize < .accessibility1 {
                        HStack {
                            conversation.formattedDate
                            Image(systemName: "chevron.right")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }
                
                conversation.lastMessage
                    .font(.subheadline)
                    .lineLimit(2, reservesSpace: true)
                    .foregroundStyle(.secondary)
                
                if dynamicTypeSize >= .accessibility1 {
                    conversation.formattedDate
                }
            }
            
            if dynamicTypeSize >= .accessibility1 {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
        }
    }
}
