//
//  MailViewModel.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI
import Combine

class MailViewModel: ObservableObject {
    @Published var selectedFolder: EmailFolder = .inbox
    @Published var emailsState: ViewState<[Email]> = .idle
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSearchSubscription()
        loadEmails()
    }
    
    private func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                self?.filterEmails(query: query)
            }
            .store(in: &cancellables)
    }
    
    private func loadEmails() {
        emailsState = .loading
        
        // Имитация загрузки данных
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.emailsState = .success(Email.mockEmails())
        }
    }
    
    private func filterEmails(query: String) {
        guard !query.isEmpty,
              case .success(let emails) = emailsState else { return }
        
        let filtered = emails.filter { email in
            email.subject.localizedCaseInsensitiveContains(query) ||
            email.sender.localizedCaseInsensitiveContains(query) ||
            email.preview.localizedCaseInsensitiveContains(query)
        }
        
        emailsState = .success(filtered)
    }
    
    func refreshEmails() {
        loadEmails()
    }
    
    func groupedEmails() -> [(String, [Email])] {
        guard case .success(let emails) = emailsState else { return [] }
        
        let grouped = Dictionary(grouping: emails) { email -> String in
            let calendar = Calendar.current
            if calendar.isDateInToday(email.date) {
                return "Today"
            } else if calendar.isDateInYesterday(email.date) {
                return "Yesterday"
            } else {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM d, yyyy"
                return formatter.string(from: email.date)
            }
        }
        
        return grouped.sorted { $0.0 > $1.0 }
    }
}
