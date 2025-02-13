//
//  PhotoSelectorViewModel.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import PhotosUI
import SwiftUI

@Observable
class PhotoSelectorViewModel {
    var images = [UIImage]()
    var selectedPhotos = [PhotosPickerItem]()
    
    @MainActor
    func convertDataToImage() {
        images.removeAll()
        
        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }
        
        selectedPhotos.removeAll()
    }
}
