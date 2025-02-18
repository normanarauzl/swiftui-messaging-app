//
//  Conversation.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation
import SwiftUI

struct Conversation: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let participants: [Participant]
    let messages: [Message]
    let updatedAt: Date
    let isRead: Bool
    let isPinned: Bool
    let profileImageLink: String?
}
