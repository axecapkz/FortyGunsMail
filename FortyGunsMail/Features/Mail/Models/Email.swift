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
                 sender: "John Doe",
                 senderEmail: "john.doe@example.com",
                 preview: "Let's discuss our progress on the current sprint...",
                 date: now,
                 isRead: false,
                 hasAttachments: true,
                 isStarred: true),
            
            Email(id: "2",
                 subject: "Project Update",
                 sender: "Jane Smith",
                 senderEmail: "jane.smith@example.com",
                 preview: "I've completed the first phase of the project...",
                 date: calendar.date(byAdding: .day, value: -1, to: now) ?? now,
                 isRead: true,
                 hasAttachments: false,
                 isStarred: false),
            
            Email(id: "3",
                 subject: "Holiday Plans",
                 sender: "Mike Johnson",
                 senderEmail: "mike.j@example.com",
                 preview: "Are you available next week for...",
                 date: calendar.date(byAdding: .day, value: -2, to: now) ?? now,
                 isRead: false,
                 hasAttachments: true,
                 isStarred: false)
        ]
    }
}
