//
//  EmailRowContent.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

struct EmailRowContent: View {
    let email: Email
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(email.sender)
                    .font(.headline)
                Text(email.subject)
                    .font(.subheadline)
                    .bold()
                Text(email.preview)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(formatDate(email.date))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(email.isRead ? Color.white : Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
