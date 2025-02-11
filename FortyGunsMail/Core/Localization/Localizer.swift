//
//  Localizer.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

class Localizer: ObservableObject {
    @Published private(set) var currentLocale: Locale = .current
    private var bundle: Bundle = .main
    
    func localized(_ key: LocalizationKey) -> String {
        NSLocalizedString(key.rawValue, bundle: bundle, comment: "")
    }
    
    func setLocale(_ identifier: String) {
        let locale = Locale(identifier: identifier)
        currentLocale = locale
        if let path = Bundle.main.path(forResource: identifier, ofType: "lproj"),
           let newBundle = Bundle(path: path) {
            bundle = newBundle
        }
    }
}

struct LocalizedText: ViewModifier {
    let key: LocalizationKey
    @EnvironmentObject var localizer: Localizer
    
    func body(content: Content) -> some View {
        Text(localizer.localized(key))
    }
}

extension View {
    func localized(_ key: LocalizationKey) -> some View {
        modifier(LocalizedText(key: key))
    }
}
