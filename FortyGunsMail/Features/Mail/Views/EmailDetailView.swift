//
//  EmailDetailView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct EmailDetailView: View {
    @StateObject private var viewModel = EmailDetailViewModel()
    let emailId: String
    
    var body: some View {
        Group {
            if let email = viewModel.email {
                VStack(alignment: .leading, spacing: 16) {
                    Text(email.subject)
                        .font(.title)
                    
                    HStack {
                        Text(email.sender)
                            .font(.headline)
                        Spacer()
                        Text(email.date, style: .date)
                    }
                    
                    Divider()
                    
                    Text(email.preview)
                        .font(.body)
                    
                    Spacer()
                }
                .padding()
            } else {
                Text("Loading...")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
        }
        .onAppear {
            viewModel.loadEmail(id: emailId)
        }
    }
}
