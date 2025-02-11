//
//  EmailDetailViewModel.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

class EmailDetailViewModel: ObservableObject {
    @Published var email: Email?
    
    func loadEmail(id: String) {
        // В будущем здесь будет загрузка конкретного письма
        email = Email.mockEmails().first
    }
}
