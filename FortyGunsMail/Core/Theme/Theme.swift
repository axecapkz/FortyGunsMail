//
//  Theme.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import Foundation
import SwiftUI

struct Theme {
    let backgroundColor: Color
    let foregroundColor: Color
    let accentColor: Color
    let secondaryColor: Color
    let tertiaryColor: Color
    
    static let light = Theme(
        backgroundColor: Color(.sRGB, white: 1.0, opacity: 1.0), // Белый фон
        foregroundColor: .primary, // Основной цвет текста
        accentColor: .blue,
        secondaryColor: .gray, // Альтернативный серый цвет
        tertiaryColor: .gray.opacity(0.6) // Более светлый серый
    )
    
    static let dark = Theme(
        backgroundColor: Color(.sRGB, white: 0.1, opacity: 1.0), // Темный фон
        foregroundColor: .primary,
        accentColor: .blue,
        secondaryColor: .gray,
        tertiaryColor: .gray.opacity(0.6)
    )
    
    static let custom = Theme(
        backgroundColor: Color(.sRGB, white: 0.95, opacity: 1.0), // Светлый серый фон
        foregroundColor: .primary,
        accentColor: .indigo,
        secondaryColor: .gray,
        tertiaryColor: .gray.opacity(0.6)
    )
}


