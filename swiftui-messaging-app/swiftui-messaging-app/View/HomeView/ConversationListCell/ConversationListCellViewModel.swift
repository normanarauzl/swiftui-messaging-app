//
//  ConversationListCellViewModel.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation
final class ConversationListCellViewModel: ObservableObject {
    @Published var conversation: Conversation
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
