//
//  AppTransition.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import Foundation

enum AppTransition: Hashable {
    case showMessageList
    case showMessageDetails(Conversation)
}
