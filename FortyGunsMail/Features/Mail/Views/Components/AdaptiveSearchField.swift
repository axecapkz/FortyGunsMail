//
//  AdaptiveSearchField.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct AdaptiveSearchField: View {
    @Binding var searchText: String
    let placeholder: String
    
    var body: some View {
        #if os(iOS)
        EmptyView()
        #else
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: $searchText)
                .textFieldStyle(.plain)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(8)
        .background(Color(.textBackgroundColor))
        .cornerRadius(8)
        .padding()
        #endif
    }
}
