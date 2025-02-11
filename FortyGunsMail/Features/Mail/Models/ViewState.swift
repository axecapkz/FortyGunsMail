//
//  ViewState.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case error(Error)
    
    var value: T? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
}
