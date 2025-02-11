//
//  SwipeableEmailRow.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct SwipeableEmailRow: View {
    let email: Email
    @State private var offset: CGFloat = 0
    @State private var previousOffset: CGFloat = 0
    let onAction: (EmailAction) -> Void
    
    var body: some View {
        ZStack {
            actionButtons
            
            EmailRowContent(email: email)
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.interactiveSpring()) {
                                offset = value.translation.width + previousOffset
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                let swipeDistance = value.translation.width
                                
                                if abs(swipeDistance) > 50 {
                                    if swipeDistance > 0 {
                                        onAction(.markAs(email.isRead ? .unread : .read))
                                    } else {
                                        onAction(.archive)
                                    }
                                    offset = 0
                                } else {
                                    offset = 0
                                }
                                previousOffset = offset
                            }
                        }
                )
        }
    }
    
    private var actionButtons: some View {
        HStack {
            // Left action (Mark as read/unread)
            Button {
                withAnimation(.spring()) {
                    onAction(.markAs(email.isRead ? .unread : .read))
                    offset = 0
                    previousOffset = 0
                }
            } label: {
                Image(systemName: email.isRead ? "envelope.badge.fill" : "envelope.open")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 50)
            }
            .background(email.isRead ? Color.blue : Color.green)
            .opacity(offset > 0 ? 1 : 0)
            
            Spacer()
            
            // Right action (Archive)
            Button {
                withAnimation(.spring()) {
                    onAction(.archive)
                    offset = 0
                    previousOffset = 0
                }
            } label: {
                Image(systemName: "archivebox.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 50)
            }
            .background(Color.orange)
            .opacity(offset < 0 ? 1 : 0)
        }
    }
}
