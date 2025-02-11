//
//  AnimatedContent.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

struct AnimatedContent<Content: View>: View {
    let content: Content
    let transition: TransitionType
    
    init(transition: TransitionType = .fade, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.transition = transition
    }
    
    var body: some View {
        content
            .transition(transition.transition)
            .animation(transition.animation, value: true)
    }
}
