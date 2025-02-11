struct AdaptivePadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, Platform.isMAC ? 20 : 16)
            .padding(.vertical, Platform.isMAC ? 16 : 12)
    }
}

extension View {
    func adaptivePadding() -> some View {
        modifier(AdaptivePadding())
    }
}