//
//  SidebarView.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selectedFolder: EmailFolder
    
    var body: some View {
        List {
            ForEach(EmailFolder.allCases) { folder in
                NavigationLink(value: folder) {
                    Label(folder.rawValue, systemImage: folder.systemImage)
                }
                .tint(.primary)
            }
        }
        .navigationTitle("Mail")
        .listStyle(SidebarListStyle())
    }
}
