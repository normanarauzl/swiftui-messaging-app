//
//  AppCoordinator.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

final class AppCoordinator: Coordinator {
    
    @Published var navigationPath: NavigationPath = NavigationPath()
    
    var associatedView: some View {
        ConversationListView(
            conversations: [
                sampleConversation,
                sampleLongConversation,
                sampleGroupConversation
            ]
        )
    }
    
    @ViewBuilder
    func buid(for route: AppTransition) -> some View {
        switch route {
        case .showMessageList:
            associatedView
        case .showMessageDetails(let conversation):
            ChatThreadView(conversation: conversation)
        }
    }
    
    func start() {
        
    }
}

extension AppCoordinator: Router {
    
    func process(route: AppTransition) {
        navigationPath.append(route)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
}
