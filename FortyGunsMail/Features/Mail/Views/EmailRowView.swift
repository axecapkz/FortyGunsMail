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
                Text(email.sender)
                    .font(.headline)
                Spacer()
                Text(email.date, style: .date)
                    .font(.caption)
            }
            
            Text(email.subject)
                .font(.subheadline)
                .foregroundColor(email.isRead ? .secondary : .primary)
            
            Text(email.preview)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding(.vertical, 4)
    }
}
