//
//  MailViewModel.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

class MailViewModel: ObservableObject {
    @Published var selectedFolder: EmailFolder = .inbox
    @Published var emails: [Email] = []
    
    init() {
        loadEmails()
    }
    
    private func loadEmails() {
        // В будущем здесь будет реальная загрузка писем
        emails = Email.mockEmails()
    }
}
