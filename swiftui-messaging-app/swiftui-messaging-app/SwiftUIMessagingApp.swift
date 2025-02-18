//
//  SwiftUIMessagingApp.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

@main
struct SwiftUIMessagingApp: App {
    
    @State var selectedConversation: Conversation?
    @ObservedObject private var appCoordinator: AppCoordinator = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appCoordinator)
        }
    }
}
