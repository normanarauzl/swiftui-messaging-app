//
//  SwiftUIMessagingApp.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

@main
struct SwiftUIMessagingApp: App {
    
    @State var selectedConversation: Conversation?
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                ConversationListView(
                    conversations: [
                        sampleConversation,
                        sampleLongConversation,
                        sampleGroupConversation
                    ],
                    selectedConversation: $selectedConversation
                )
            } detail: {
                if let selectedConversation {
                    ChatThreadView(conversation: selectedConversation)
                } else {
                    ContentUnavailableView("Select a conversation", systemImage: "exclamationmark.bubble")
                }
            }
        }
    }
}
