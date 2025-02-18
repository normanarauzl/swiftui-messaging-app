//
//  ContentView.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @State var title: String = ""
    
    var body: some View {
        NavigationStack(path: $appCoordinator.navigationPath) {
            appCoordinator.associatedView
                .navigationDestination(for: AppTransition.self) {
                    appCoordinator.buid(for: $0)
                }
        }
    }
}

#Preview {
    ContentView()
}
