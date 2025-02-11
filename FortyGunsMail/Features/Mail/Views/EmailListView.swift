//
//  EmailListView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

struct EmailListView: View {
    @ObservedObject var viewModel: MailViewModel
    @Environment(\.refresh) private var refresh
    
    var body: some View {
        Group {
            switch viewModel.emailsState {
            case .idle, .loading:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success:
                emailsList
            case .error(let error):
                ErrorView(error: error, retryAction: viewModel.refreshEmails)
            }
        }
        .navigationTitle(viewModel.selectedFolder.rawValue)
        .searchable(text: $viewModel.searchText, prompt: "Search emails")
        .refreshable {
            await refresh?.callAsFunction()
            viewModel.refreshEmails()
        }
    }
    
    private var emailsList: some View {
        List {
            ForEach(viewModel.groupedEmails(), id: \.0) { section in
                Section(header: Text(section.0)) {
                    ForEach(section.1) { email in
                        NavigationLink(value: email.id) {
                            EmailRowView(email: email)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                // Toggle read status
                            } label: {
                                Label(email.isRead ? "Mark as Unread" : "Mark as Read",
                                      systemImage: email.isRead ? "envelope" : "envelope.open")
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                // Delete email
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
        }
        #if os(iOS)
        .listStyle(.insetGrouped)
        #else
        .listStyle(.sidebar)
        #endif
    }
}
