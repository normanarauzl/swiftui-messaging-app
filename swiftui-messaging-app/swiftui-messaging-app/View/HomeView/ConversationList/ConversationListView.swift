//
//  ConversationListView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct ConversationListView: View {
    @State var isShowingNewMessageView = false
    @State var textToSearch = ""
    @EnvironmentObject private var coordinator: AppCoordinator
    
    private let viewModel: ConversationListViewModel
    
    init(viewModel: ConversationListViewModel,
        isShowingNewMessageView: Bool = false) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.filteredConversations(textToSearch)) { conversation in
            ConversationListCell(conversation: conversation)
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button { }
                    label: { Image(systemName: "message.badge") }
                    .tint(.blue)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button { }
                    label: { Image(systemName: "trash") }
                    .tint(.red)
                    
                    Button { }
                    label: { Image(systemName: "bell.slash") }
                    .tint(.purple)
                }
                .onTapGesture {
                    coordinator.process(route: .showConversationDetails(conversation))
                }
        }
        .searchable(text: $textToSearch, prompt: "Search conversation...")
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem {
                Button("New Conversation", systemImage: "square.and.pencil") {
                    isShowingNewMessageView.toggle()
                }
            }
        }
        .sheet(isPresented: $isShowingNewMessageView) {
            NewMessageView(isPresented: $isShowingNewMessageView)
        }
    }
}
