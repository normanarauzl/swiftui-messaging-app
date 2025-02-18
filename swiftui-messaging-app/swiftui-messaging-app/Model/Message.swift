//
//  Message.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

struct Message: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let text: String
    let createdAt: Date
    let updatedAt = Date()
    let author: Participant
    // FEEDBACK: - For default values is better to use init.
    let attachments: Attachment? = nil // FEEDBACK: - This never will be update because is a constants
    let reactions: [Reaction] = [] // FEEDBACK: - This never will be update because is a constants
}
