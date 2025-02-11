//
//  EmailFolder.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

enum EmailFolder: String, Identifiable, CaseIterable {
    case inbox = "Inbox"
    case drafts = "Drafts"
    case sent = "Sent"
    case trash = "Trash"
    case spam = "Spam"
    
    var id: String { rawValue }
    
    var systemImage: String {
        switch self {
        case .inbox: return "tray.fill"
        case .drafts: return "doc.fill"
        case .sent: return "paperplane.fill"
        case .trash: return "trash.fill"
        case .spam: return "exclamationmark.octagon.fill"
        }
    }
}
