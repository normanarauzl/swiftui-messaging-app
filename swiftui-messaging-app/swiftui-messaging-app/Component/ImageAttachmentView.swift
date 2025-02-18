//
//  ImageAttachmentView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

@ViewBuilder
func ImageAttachmentView(_ thumbnail: Image, isFromYou: Bool, shouldSendInTheFuture: Bool) -> some View {
    var forgroundColor: Color {
        if shouldSendInTheFuture {
            return Color.blue
        } else if isFromYou {
            return Color.white
        } else {
            return Color.primary
        }
    }
    
    thumbnail
        .resizable()
        .scaledToFit()
        .mask(
            MessageBubble()
                .fill()
                .stroke(Color.blue, style: StrokeStyle(dash: [shouldSendInTheFuture ? 6 : 0]))
                .rotation3DEffect(isFromYou ? .degrees(0) : .degrees(180), axis: (x: 0, y: 1, z: 0))
        )
}

@ViewBuilder
func VideoAttachmentView(_ thumbnail: Image, isFromYou: Bool, shouldSendInTheFuture: Bool) -> some View {
    var forgroundColor: Color {
        if shouldSendInTheFuture {
            return Color.blue
        } else if isFromYou {
            return Color.white
        } else {
            return Color.primary
        }
    }
    
    ZStack {
        thumbnail
            .resizable()
            .scaledToFit()
            .mask(
                MessageBubble()
                    .fill()
                    .stroke(Color.blue, style: StrokeStyle(dash: [shouldSendInTheFuture ? 6 : 0]))
                    .rotation3DEffect(isFromYou ? .degrees(0) : .degrees(180), axis: (x: 0, y: 1, z: 0))
            )
        
        Image(systemName: "play.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 10)
            .padding(8)
            .background(.ultraThinMaterial)
            .foregroundStyle(.black)
            .clipShape(Circle())
    }
}

@ViewBuilder
func OtherAttachmentView(_ thumbnail: Image, fileName: String, docType: String, fileSize: String, isFromYou: Bool, shouldSendInTheFuture: Bool) -> some View {
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
    
    HStack {
        thumbnail
        
        VStack {
            Text(fileName).bold()
            HStack {
                Text(docType)
                Text(fileSize)
            }
            .font(.callout)
            .foregroundStyle(.secondary)
        }
    }
    .messageBubbleStyle(isFromYou: isFromYou, shouldSendInTheFuture: shouldSendInTheFuture)
}
