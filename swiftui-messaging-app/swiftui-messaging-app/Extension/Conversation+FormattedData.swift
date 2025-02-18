//
//  Conversation+FormattedData.swift
//  swiftui-messaging-app
//
//  Created by Norman Arauz on 18/2/25.
//

import Foundation
import SwiftUI

extension Conversation {
    
    var particpantsNotIncludingCurrentUser: [Participant] {
        participants.filter { $0.id != sampleLoggedInUser.id }
    }
    
    var firstParticipantNotIncludingCurrentUser: Participant? {
        particpantsNotIncludingCurrentUser.first
    }
    
    var formattedDate: Text {
        if updatedAt.daysSinceNow < 1 {
            return Text(updatedAt.formatted(date: .omitted, time: .shortened))
        } else if updatedAt.daysSinceNow < 7 {
            return Text(updatedAt.formatted(.dateTime.weekday(.wide)))
        }
        
        return Text(updatedAt.formatted(date: .numeric, time: .omitted))
    }
    
    var formatConversationName: Text {
        let participants = particpantsNotIncludingCurrentUser
        
        switch participants.count {
        case 0:
            return Text("Unknown")
            
        case 1:
            guard let name = participants.first?.name else { return Text("Unknown") }
            return Text(name, format: .name(style: .medium))
            
        case 2:
            let names = participants.map { $0.firstName }.joined(separator: " & ")
            return Text(names)
            
        default:
            let firstNames = participants.map { $0.firstName }
            let allButLast = firstNames.dropLast().joined(separator: ", ")
            let last = firstNames.last ?? ""
            return Text("\(allButLast), & \(last)")
        }
    }
    
    var lastMessage: Text {
        guard let lastMessage = messages.last else {
            return Text("No messages yet")
        }
        
        return Text(lastMessage.text)
    }
}
