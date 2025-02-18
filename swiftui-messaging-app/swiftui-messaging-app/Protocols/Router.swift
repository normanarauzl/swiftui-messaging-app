//
//  Router.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 13/2/25.
//

import SwiftUI

protocol Router {
    associatedtype Route
    
    var navigationPath: NavigationPath { get set }
    
    func process(route: Route)
    func pop()
}

protocol AppRouter: Router where Route == AppTransition { }
