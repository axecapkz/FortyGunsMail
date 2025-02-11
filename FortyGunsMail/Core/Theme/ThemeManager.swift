//
//  ThemeManager.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme
    @AppStorage("selectedTheme") private var selectedTheme: String = "light"
    
    init() {
        self.currentTheme = Theme.light
        updateTheme(name: selectedTheme)
    }
    
    func updateTheme(name: String) {
        selectedTheme = name
        switch name {
        case "dark": currentTheme = .dark
        case "custom": currentTheme = .custom
        default: currentTheme = .light
        }
    }
}
