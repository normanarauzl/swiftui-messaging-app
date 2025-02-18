//
//  AppCoordinator.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

final class AppCoordinator: Coordinator {
    @Published var navigationPath: NavigationPath = NavigationPath()
    
    lazy var associatedView: SomeView = homeView
    
    private var homeView: some View {
        ConversationListView(conversations: [
            sampleConversation,
            sampleLongConversation,
            sampleGroupConversation
        ])
    }
    
    @ViewBuilder
    func build(for route: AppTransition) -> some View {
        switch route {
        case .showMessageList:
            homeView
        case .showMessageDetails(let conversation):
            ChatThreadView(conversation: conversation)
        }
    }
    
    func start() { }
}

extension AppCoordinator: Router {
    func process(route: AppTransition) {
        navigationPath.append(route)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
