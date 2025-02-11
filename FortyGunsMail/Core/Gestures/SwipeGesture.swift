//
//  SwipeGesture.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct SwipeGesture: ViewModifier {
    let onSwipe: (CGFloat) -> Void
    let onSwipeEnded: (CGFloat) -> Void
    
    func body(content: Content) -> some View {
        content.gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onChanged { value in
                    onSwipe(value.translation.width)
                }
                .onEnded { value in
                    onSwipeEnded(value.translation.width)
                }
        )
    }
}
