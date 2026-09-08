import SwiftUI

struct HeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("LaunchMe")
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("App Launcher for MacBook Pro 2019")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Status indicators
                HStack(spacing: 8) {
                    // System info
                    Label(
                        title: { Text("macOS 15.7.9") },
                        icon: { Image(systemName: "macbook") }
                    )
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    HeaderView()
}