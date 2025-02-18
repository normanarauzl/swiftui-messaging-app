//
//  Coordinator.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype SomeView: View
    associatedtype Route
    
    var associatedView: SomeView { get }
    
    func start()
    func build(for route: Route) -> SomeView
    func popToRoot()
}
