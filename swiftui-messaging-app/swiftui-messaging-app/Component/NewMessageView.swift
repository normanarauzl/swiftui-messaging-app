//
//  NewMessageView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var isPresented: Bool
    @State var to = ""
    @State var message = ""
    @State var attachments = [Attachment]()
    @State var isShowingAttachmentPicker = false
    let matchingGeometryID = "attachments"
    @Namespace var attachmentPickerAnimation
    @State var photoSelectorVM = PhotoSelectorViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Text("New Message")
                    .font(.system(size: 17, weight: .semibold))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(alignment: .trailing) {
                Button("Cancel") {
                    isPresented.toggle()
                }
                .padding(.trailing)
            }
            .background(.ultraThinMaterial)
            
            VStack {
                HStack {
                    TextField("To:", text: $to)
                    
                    Button {
                        // code to add new participants here
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                Divider()
            }
            .padding()
            
            Spacer()
            
            MessageComposerView(
                messageText: $message,
                isShowingAttachmentPicker: $isShowingAttachmentPicker,
                matchingGeometryID: matchingGeometryID,
                attachmentPickerAnimation: attachmentPickerAnimation,
                attachments: $attachments,
                photoSelectorVM: photoSelectorVM,
                onSend: handleSend
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
    
    private func handleSend() {
        let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.isEmpty == false else { return }
        
        message = ""
        attachments.removeAll()
        photoSelectorVM.images.removeAll()
    }
}
