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
    let attachments: Attachment? = nil
    let reactions: [Reaction] = .init()
}
