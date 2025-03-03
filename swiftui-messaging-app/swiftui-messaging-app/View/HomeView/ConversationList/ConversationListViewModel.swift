//
//  ConversationListViewModel.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

final class ConversationListViewModel: ObservableObject {
    
    let conversations: [Conversation]
    
    init(conversations: [Conversation]) {
        self.conversations = conversations
    }
    
    func filteredConversations(_ textToSearch: String) -> [Conversation] {
        if textToSearch.isEmpty {
            return conversations
        }
        
        return conversations.filter {
            $0.messages.contains(where: { $0.text.localizedCaseInsensitiveContains(textToSearch) }) ||
            $0.participants.contains(where: { $0.firstName.localizedCaseInsensitiveContains(textToSearch) }) ||
            $0.participants.contains(where: { $0.lastName.localizedCaseInsensitiveContains(textToSearch) })
        }
    }
}
