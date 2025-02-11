//
//  AttachmentPreview.swift
//  FortyGunsMail
//
//  Created by Azamat Kenjebayev on 2/11/25.
//

import SwiftUI

struct AttachmentPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "doc.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                )
            
            Text("Document.pdf")
                .font(.caption)
                .lineLimit(1)
            
            Text("123 KB")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(width: 80)
    }
}
