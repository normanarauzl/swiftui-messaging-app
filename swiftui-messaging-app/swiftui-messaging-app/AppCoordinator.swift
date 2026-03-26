//
//  AppCoordinator.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

final class AppCoordinator: Coordinator {
    @Published var navigationPath: NavigationPath = NavigationPath()
    
    lazy var associatedView: SomeView = build(for: .showMessageList)
    
    private var homeView: some View {
        let viewModel: ConversationListViewModel = .init(conversations: [
            sampleConversation,
            sampleLongConversation,
            sampleGroupConversation
         ])
        
        return ConversationListView(viewModel: viewModel)
    }
    
    @ViewBuilder
    func build(for route: AppTransition) -> some View {
        switch route {
        case .showMessageList:
            homeView
        case .showConversationDetails(let conversation):
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
