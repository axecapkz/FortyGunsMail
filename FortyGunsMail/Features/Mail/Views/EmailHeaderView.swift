//
//  EmailHeaderView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct EmailHeaderView: View {
    let email: Email
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(email.subject)
                .font(.title)
                .fontWeight(.bold)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(email.sender)
                        .font(.headline)
                    Text(email.senderEmail)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(formatDate(email.date))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    if email.hasAttachments {
                        Label("Has attachments", systemImage: "paperclip")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
