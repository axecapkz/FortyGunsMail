//
//  Platform.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

enum Platform {
    static var isMAC: Bool {
        #if os(macOS)
        return true
        #else
        return false
        #endif
    }
    
    static var isIOS: Bool {
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }
}