//
//  LocalizationKey.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

enum LocalizationKey: String {
    case inbox = "folder.inbox"
    case drafts = "folder.drafts"
    case sent = "folder.sent"
    case archive = "folder.archive"
    case spam = "folder.spam"
    case trash = "folder.trash"
    
    case markAsRead = "action.mark_as_read"
    case markAsUnread = "action.mark_as_unread"
    case delete = "action.delete"
    case moveToSpam = "action.move_to_spam"
    
    case search = "common.search"
    case cancel = "common.cancel"
    case error = "common.error"
    case retry = "common.retry"
}
