//
//  Participant.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation

struct Participant: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let firstName: String
    let lastName: String
    let username: String
    let profileImageLink: URL?
    
    var name: PersonNameComponents {
        PersonNameComponents(
            givenName: firstName,
            familyName: lastName,
            nickname: username
        )
    }
}
