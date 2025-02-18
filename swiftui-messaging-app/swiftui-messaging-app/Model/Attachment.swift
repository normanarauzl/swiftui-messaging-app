//
//  Attachment.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

struct Attachment: Identifiable, Hashable {
    let id: String
    let width: Int
    let height: Int
    let url: String
    let fileName: String
    let size: Int
    let type: String
    let thumbnails: Thumbnails
}
