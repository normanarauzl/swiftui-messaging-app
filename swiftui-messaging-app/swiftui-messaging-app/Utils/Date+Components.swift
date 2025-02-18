//
//  Date+Components.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

extension Date {
    var daysSinceNow: Int {
        Calendar.current.dateComponents([.day], from: self, to: Date.now).day ?? .zero
    }
}
