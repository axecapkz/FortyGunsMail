//
//  Email.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

struct Email: Identifiable {
    let id: String
    let subject: String
    let sender: String
    let preview: String
    let date: Date
    let isRead: Bool
    
    static func mockEmails() -> [Email] {
        [
            Email(id: "1", subject: "Weekly Meeting", sender: "John Doe", 
                 preview: "Let's discuss our progress...", date: Date(), isRead: false),
            Email(id: "2", subject: "Project Update", sender: "Jane Smith", 
                 preview: "I've completed the first phase...", date: Date(), isRead: true),
            Email(id: "3", subject: "Holiday Plans", sender: "Mike Johnson", 
                 preview: "Are you available next week...", date: Date(), isRead: false)
        ]
    }
}
