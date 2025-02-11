//
//  EmailRowView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct EmailRowView: View {
    let email: Email
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Circle()
                    .fill(email.isRead ? .clear : .blue)
                    .frame(width: 8, height: 8)
                
                Text(email.sender)
                    .font(.headline)
                    .lineLimit(1)
                
                Spacer()
                
                Text(formatDate(email.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(email.subject)
                .font(.subheadline)
                .foregroundColor(email.isRead ? .secondary : .primary)
                .lineLimit(1)
            
            HStack {
                Text(email.preview)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Spacer()
                
                HStack(spacing: 4) {
                    if email.hasAttachments {
                        Image(systemName: "paperclip")
                            .foregroundColor(.secondary)
                    }
                    if email.isStarred {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
    
    private func formatDate(_ date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd"
            return formatter.string(from: date)
        }
    }
}
