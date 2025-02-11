//
//  EmailDetailView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct EmailDetailView: View {
    @StateObject private var viewModel = EmailDetailViewModel()
    @State private var selection: String?
    let emailId: String
    
    var body: some View {
        Group {
            switch viewModel.emailState {
            case .idle, .loading:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let email):
                emailContent(email)
            case .error(let error):
                ErrorView(error: error) {
                    viewModel.loadEmail(id: emailId)
                }
            }
        }
        .onAppear {
            viewModel.loadEmail(id: emailId)
        }
    }
    
    @ViewBuilder
    private func emailContent(_ email: Email) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                EmailHeaderView(email: email)
                    .adaptivePadding()
                
                Divider()
                
                AdaptiveToolbar(
                    email: email,
                    onReply: {},
                    onForward: {},
                    onDelete: {},
                    onStar: {}
                )
                
                Text(email.preview)
                    .font(.body)
                    .adaptivePadding()
                
                if email.hasAttachments {
                    attachmentsSection
                }
                
                Spacer()
            }
        }
        #if os(macOS)
        .frame(minWidth: 500)
        #endif
    }
    
    private var attachmentsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Attachments")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<3) { _ in
                        AttachmentPreview()
                    }
                }
            }
        }
        .adaptivePadding()
    }
}
