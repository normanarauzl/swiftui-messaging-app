//
//  ConversationListView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct ConversationListView: View {
    let conversations: [Conversation]
    @Binding var selectedConversation: Conversation?
    @State var isShowingNewMessageView = false
    @State var textToSearch = ""
    
    // to learn more checkout https://medium.com/@jpmtech/how-to-add-search-to-your-swiftui-app-2d724bf72c16
    var filteredConversations: [Conversation] {
        if textToSearch.isEmpty {
            return conversations
        }
        
        return conversations.filter {
            $0.messages.contains(where: { $0.text.localizedCaseInsensitiveContains(textToSearch) }) ||
            $0.participants.contains(where: { $0.firstName.localizedCaseInsensitiveContains(textToSearch) }) ||
            $0.participants.contains(where: { $0.lastName.localizedCaseInsensitiveContains(textToSearch) })
        }
    }
        
    init(
        conversations: [Conversation],
        selectedConversation: Binding<Conversation?>,
        isShowingNewMessageView: Bool = false
    ) {
        self.conversations = conversations
        self._selectedConversation = selectedConversation
        self.isShowingNewMessageView = isShowingNewMessageView
    }
    
    var body: some View {
        List(filteredConversations, selection: $selectedConversation) { conversation in
            ConversationListCell(conversation: conversation)
            // to learn more checkout https://medium.com/@jpmtech/swiftui-list-from-beginner-to-merlin-5308261b78b6
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        // mark conversation as unread
                    } label: {
                        Image(systemName: "message.badge")
                    }
                    .tint(.blue)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        // Delete conversation
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                    
                    Button {
                        // turn of notifications
                    } label: {
                        Image(systemName: "bell.slash")
                    }
                    .tint(.purple)
                }
                .onTapGesture {
                    selectedConversation = conversation
                }
        }
        .searchable(text: $textToSearch)
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem {
                Button("New Conversation", systemImage: "square.and.pencil") {
                    isShowingNewMessageView.toggle()
                }
            }
        }
        .sheet(isPresented: $isShowingNewMessageView) {
            NewMessageView(isPresented: $isShowingNewMessageView)
        }
    }
}
