//
//  TransitionType.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

enum TransitionType {
    case slide
    case fade
    case scale
    case move(edge: Edge)
    
    var animation: Animation {
        switch self {
        case .slide:
            return .spring(response: 0.3, dampingFraction: 0.8)
        case .fade:
            return .easeInOut(duration: 0.2)
        case .scale:
            return .spring(response: 0.4, dampingFraction: 0.7)
        case .move:
            return .spring(response: 0.3, dampingFraction: 0.8)
        }
    }
    
    var transition: AnyTransition {
        switch self {
        case .slide:
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        case .fade:
            return .opacity
        case .scale:
            return .scale.combined(with: .opacity)
        case .move(let edge):
            return .move(edge: edge).combined(with: .opacity)
        }
    }
}
