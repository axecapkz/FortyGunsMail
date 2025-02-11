//
//  EmailState.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

enum EmailState: String {
    case unread
    case read
    case flagged
    case archived
    case deleted
    case spam
    
    var iconName: String {
        switch self {
        case .unread: return "envelope.badge.fill"
        case .read: return "envelope.open"
        case .flagged: return "flag.fill"
        case .archived: return "archivebox"
        case .deleted: return "trash"
        case .spam: return "exclamationmark.shield"
        }
    }
    
    var color: Color {
        switch self {
        case .unread: return .blue
        case .read: return .secondary
        case .flagged: return .orange
        case .archived: return .gray
        case .deleted: return .red
        case .spam: return .yellow
        }
    }
}
