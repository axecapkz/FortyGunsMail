//
//  EmailError.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation

enum EmailError: LocalizedError {
    case loadFailed
    case notFound
    
    var errorDescription: String? {
        switch self {
        case .loadFailed:
            return "Failed to load emails"
        case .notFound:
            return "Email not found"
        }
    }
}
