//
//  MessageBubbleStyle.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import SwiftUI

struct MessageBubbleStyle: ViewModifier {
    let isFromYou: Bool
    let shouldSendInTheFuture: Bool
    var messageFillColor: Color {
        if shouldSendInTheFuture {
            return Color.clear
        } else if isFromYou {
            return Color.blue
        } else {
            return Color.secondary.opacity(0.2)
        }
    }
    var forgroundColor: Color {
        if shouldSendInTheFuture {
            return Color.blue
        } else if isFromYou {
            return Color.white
        } else {
            return Color.primary
        }
    }
    
    func body(content: Content) -> some View {
            content
                .foregroundStyle(forgroundColor)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .padding(isFromYou ? .trailing : .leading, 8) // 8 is the tail width
                .background(
                    MessageBubble()
                        .fill(messageFillColor)
                        .stroke(Color.blue, style: StrokeStyle(dash: [shouldSendInTheFuture ? 6 : 0]))
                        .rotation3DEffect(isFromYou ? .degrees(0) : .degrees(180), axis: (x: 0, y: 1, z: 0))
                )
    }
}
