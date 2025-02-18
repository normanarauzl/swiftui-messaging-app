//
//  View+MessageBubbleStyle.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import SwiftUI

extension View {
    func messageBubbleStyle(isFromYou: Bool, shouldSendInTheFuture: Bool = false) -> some View {
        modifier(MessageBubbleStyle(isFromYou: isFromYou, shouldSendInTheFuture: shouldSendInTheFuture))
    }
}
