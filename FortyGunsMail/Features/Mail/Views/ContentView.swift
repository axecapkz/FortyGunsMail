//
//  ContentView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var mailViewModel = MailViewModel()
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selectedFolder: $mailViewModel.selectedFolder)
                .navigationDestination(for: EmailFolder.self) { folder in
                    EmailListView(viewModel: mailViewModel)
                }
        } content: {
            EmailListView(viewModel: mailViewModel)
                .navigationDestination(for: String.self) { emailId in
                    EmailDetailView(emailId: emailId)
                }
        } detail: {
            Text("Select an email")
                .foregroundColor(.secondary)
        }
    }
}
