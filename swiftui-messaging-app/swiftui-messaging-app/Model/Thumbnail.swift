//
//  Thumbnail.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

struct Thumbnails: Hashable {
    let small: Thumbnail
    let large: Thumbnail
    let full: Thumbnail
}

struct Thumbnail: Hashable {
    let width: Int
    let height: Int
    let url: String
}
