//
//  ChatThreadView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct ChatThreadView: View {
    let conversation: Conversation
    @State var text = ""
    @State var isShowingAttachmentPicker = false
    @State var attachments: [Attachment] = []
    @Namespace var attachmentPickerAnimation
    let matchingGeometryID = "attachments"
    @State var photoSelectorVM = PhotoSelectorViewModel()
    @State private var messages: [Message]
    
    init(conversation: Conversation) {
        self.conversation = conversation
        _messages = State(initialValue: conversation.messages)
    }
    
    var body: some View {
        VStack {
            MessageListView(
                messages: messages,
                shouldShowParticipantInfo: conversation.participants.count > 2
            )
            
            MessageComposerView(
                messageText: $text,
                isShowingAttachmentPicker: $isShowingAttachmentPicker,
                matchingGeometryID: matchingGeometryID,
                attachmentPickerAnimation: attachmentPickerAnimation,
                attachments: $attachments,
                photoSelectorVM: photoSelectorVM,
                onSend: sendMessage
            )
            .padding([.horizontal, .bottom])
        }
        .overlay {
            if isShowingAttachmentPicker {
                AddAttachmentsView(
                    isPresented: $isShowingAttachmentPicker,
                    matchingGeometryID: matchingGeometryID,
                    attachmentPickerAnimation: attachmentPickerAnimation,
                    photoSelectorVM: photoSelectorVM
                )
            }
        }
    }
    
    private func sendMessage() {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.isEmpty == false else { return }
        
        let newMessage = Message(
            text: trimmed,
            createdAt: .now,
            author: sampleLoggedInUser
        )
        
        messages.append(newMessage)
        text = ""
        attachments.removeAll()
        photoSelectorVM.images.removeAll()
    }
}
