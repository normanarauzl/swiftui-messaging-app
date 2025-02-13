//
//  AddAttachmentsView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import PhotosUI
import SwiftUI

struct AddAttachmentsView: View {
    @Binding var isPresented: Bool
    let matchingGeometryID: String
    let attachmentPickerAnimation: Namespace.ID
    @Bindable var photoSelectorVM: PhotoSelectorViewModel
    @State var isShowingPhotosPicker = false
    let maxPhotosToSelect = 10
        
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(.clear)
                .edgesIgnoringSafeArea(.all)
                .matchedGeometryEffect(id: matchingGeometryID, in: attachmentPickerAnimation, isSource: false)
            // to learn more checkout https://medium.com/@jpmtech/using-matchedgeometryeffect-in-swiftui-d9d5542c5a4d
            
            VStack(alignment: .leading, spacing: 30) {
                // to learn more checkout https://medium.com/@jpmtech/swiftui-displaying-a-photo-picker-2531c06d5209
                PhotosPicker(
                    selection: $photoSelectorVM.selectedPhotos,
                    maxSelectionCount: maxPhotosToSelect,
                    selectionBehavior: .ordered,
                    matching: .images
                ) {
                    HStack {
                        Image(systemName: "photo.circle.fill")
                            .symbolRenderingMode(.multicolor)
                        Text("Photo")
                            .foregroundStyle(.primary)
                    }
                }
                .onChange(of: photoSelectorVM.selectedPhotos) { _, _ in
                    photoSelectorVM.convertDataToImage()
                }
            }
            .font(.title)
            .padding(.leading, 40)
            .padding(.bottom, 84)
        }
        .background(.ultraThinMaterial)
        .onTapGesture {
            withAnimation {
                isPresented.toggle()
            }
        }
    }
}
