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
            if dynamicTypeSize >= .accessibility1 {
                EmptyView()
            } else {
                Circle()
                    .fill(conversation.isRead ? .clear : .blue)
                    .frame(width: 10, height: 10)
                if let participant = conversation.firstParticipantNotIncludingCurrentUser {
                    AvatarView(participant: participant, size: 50)
                }
            }
            
            if dynamicTypeSize >= .accessibility1 {
                VStack(alignment: .leading) {
                    HStack {
                        if !conversation.isRead {
                            Circle()
                                .fill(.blue)
                                .frame(width: 20, height: 20)
                        }

                        conversation.formatConversationName
                            .font(.headline)
                            .lineLimit(2)
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    
                    Text(conversation.messages.last!.text)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundStyle(.secondary)
                    
                    conversation.formattedDate
                }
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        conversation.formatConversationName
                            .font(.headline)
                            .lineLimit(1)
                        Spacer()
                        
                        HStack {
                            conversation.formattedDate
                            Image(systemName: "chevron.right")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                    
                    Text(conversation.messages.last!.text)
                        .font(.subheadline)
                        .lineLimit(2, reservesSpace: true)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
