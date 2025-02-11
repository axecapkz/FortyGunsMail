//
//  AdaptiveToolbar.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import Foundation
import SwiftUI

struct AdaptiveToolbar: View {
    let email: Email
    let onReply: () -> Void
    let onForward: () -> Void
    let onDelete: () -> Void
    let onStar: () -> Void
    
    var body: some View {
        #if os(iOS)
        iosToolbar
        #else
        macToolbar
        #endif
    }
    
    private var iosToolbar: some View {
        HStack {
            Button(action: onReply) {
                Image(systemName: "arrow.turn.up.left")
            }
            
            Button(action: onForward) {
                Image(systemName: "arrow.turn.up.right")
            }
            
            Button(action: onStar) {
                Image(systemName: email.isStarred ? "star.fill" : "star")
                    .foregroundColor(email.isStarred ? .yellow : .primary)
            }
            
            Button(action: onDelete) {
                Image(systemName: "trash")
            }
        }
    }
    
    private var macToolbar: some View {
        HStack {
            Button(action: onReply) {
                Label("Reply", systemImage: "arrow.turn.up.left")
            }
            .buttonStyle(.bordered)
            
            Button(action: onForward) {
                Label("Forward", systemImage: "arrow.turn.up.right")
            }
            .buttonStyle(.bordered)
            
            Spacer()
            
            Button(action: onStar) {
                Label(email.isStarred ? "Unstar" : "Star", 
                      systemImage: email.isStarred ? "star.fill" : "star")
            }
            .buttonStyle(.bordered)
            
            Button(role: .destructive, action: onDelete) {
                Label("Delete", systemImage: "trash")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
