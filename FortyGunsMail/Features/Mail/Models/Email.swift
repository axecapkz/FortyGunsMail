//
//  Email.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

struct Email: Identifiable, Hashable {
    let id: String
    let subject: String
    let sender: String
    let senderEmail: String
    let preview: String
    let date: Date
    let isRead: Bool
    let hasAttachments: Bool
    let isStarred: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Email, rhs: Email) -> Bool {
        lhs.id == rhs.id
    }
    
    static func mockEmails() -> [Email] {
        let calendar = Calendar.current
        let now = Date()
        
        return [
            Email(id: "1",
                 subject: "Weekly Team Meeting",
                 sender: "Bill Gates",
                 senderEmail: "bill@gates.com",
                 preview: "Let's discuss our progress on the current project...",
                 date: now,
                 isRead: false,
                 hasAttachments: true,
                 isStarred: true),
            
            Email(id: "2",
                 subject: "Project Update",
                 sender: "Elon Musk",
                 senderEmail: "elon@xe.com",
                 preview: "Let's complete the first phase of the project...",
                 date: calendar.date(byAdding: .day, value: -1, to: now) ?? now,
                 isRead: true,
                 hasAttachments: false,
                 isStarred: false),
            
            Email(id: "3",
                 subject: "Holiday Plans",
                 sender: "Dwayne Johnson",
                 senderEmail: "dwayne@rock.com",
                 preview: "Are you available next week for...",
                 date: calendar.date(byAdding: .day, value: -2, to: now) ?? now,
                 isRead: false,
                 hasAttachments: true,
                 isStarred: false)
        ]
    }
}
