//
//  ThemeModifier.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

struct ThemeModifier: ViewModifier {
    let theme: Theme
    
    func body(content: Content) -> some View {
        content
            .background(theme.backgroundColor)
            .foregroundColor(theme.foregroundColor)
            .tint(theme.accentColor)
    }
}

extension View {
    func withTheme(_ theme: Theme) -> some View {
        modifier(ThemeModifier(theme: theme))
    }
}
