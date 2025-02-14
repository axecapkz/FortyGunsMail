//
//  EmailDetailViewModel.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

class EmailDetailViewModel: ObservableObject {
    @Published var emailState: ViewState<Email> = .idle
    
    func loadEmail(id: String) {
        emailState = .loading
        
        // Imitation of preloading emails */will be fixed lated/*
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let email = Email.mockEmails().first(where: { $0.id == id }) {
                self.emailState = .success(email)
            } else {
                self.emailState = .error(EmailError.notFound)
            }
        }
    }
}
