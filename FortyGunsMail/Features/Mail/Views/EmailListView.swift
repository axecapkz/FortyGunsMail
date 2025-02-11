//
//  EmailListView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//


import SwiftUI

struct EmailListView: View {
    let emails: [Email]
    
    var body: some View {
        List(emails) { email in
            NavigationLink(value: email.id) {
                EmailRowView(email: email)
            }
        }
        .navigationTitle("Inbox")
    }
}
