//
//  Reaction.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

struct Reaction: Identifiable, Hashable {
    let id: UUID
    let message: Message
    let author: Participant
}
