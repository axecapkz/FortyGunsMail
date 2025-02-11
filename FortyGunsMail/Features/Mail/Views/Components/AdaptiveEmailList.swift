struct AdaptiveEmailList: View {
    @ObservedObject var viewModel: MailViewModel
    let selection: Binding<String?>
    
    var body: some View {
        Group {
            #if os(iOS)
            iosEmailList
            #else
            macEmailList
            #endif
        }
    }
    
    private var iosEmailList: some View {
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
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
    private var macEmailList: some View {
        List(selection: selection) {
            ForEach(viewModel.groupedEmails(), id: \.0) { section in
                Section(header: Text(section.0)) {
                    ForEach(section.1) { email in
                        EmailRowView(email: email)
                            .tag(email.id)
                            .contextMenu {
                                Button {
                                    // Mark as read/unread
                                } label: {
                                    Label(email.isRead ? "Mark as Unread" : "Mark as Read",
                                          systemImage: email.isRead ? "envelope" : "envelope.open")
                                }
                                
                                Button {
                                    // Star/unstar
                                } label: {
                                    Label(email.isStarred ? "Remove Star" : "Add Star",
                                          systemImage: email.isStarred ? "star.fill" : "star")
                                }
                                
                                Divider()
                                
                                Button(role: .destructive) {
                                    // Delete
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
        }
        .listStyle(.sidebar)
    }
}