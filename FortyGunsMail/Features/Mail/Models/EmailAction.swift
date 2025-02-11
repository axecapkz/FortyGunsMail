//
//  EmailAction.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

enum EmailAction {
    case markAs(EmailState)
    case move(EmailFolder)
    case delete
    case archive
    case spam
    
    var animation: Animation {
        switch self {
        case .markAs: return .spring(response: 0.3, dampingFraction: 0.7)
        case .move: return .easeInOut(duration: 0.3)
        case .delete: return .easeInOut(duration: 0.2)
        case .archive: return .spring(response: 0.4, dampingFraction: 0.8)
        case .spam: return .spring(response: 0.3, dampingFraction: 0.7)
        }
    }
}
