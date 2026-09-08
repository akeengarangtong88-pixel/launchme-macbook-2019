import SwiftUI

struct BottomNavigationView: View {
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 0) {
            NavigationButton(
                icon: "square.grid.2x2",
                label: "Launcher",
                isSelected: selectedTab == "launcher"
            ) {
                selectedTab = "launcher"
            }
            
            NavigationButton(
                icon: "bolt.fill",
                label: "Workflows",
                isSelected: selectedTab == "workflows"
            ) {
                selectedTab = "workflows"
            }
            
            NavigationButton(
                icon: "square.grid.3x2",
                label: "Spaces",
                isSelected: selectedTab == "spaces"
            ) {
                selectedTab = "spaces"
            }
            
            NavigationButton(
                icon: "gear",
                label: "Settings",
                isSelected: selectedTab == "settings"
            ) {
                selectedTab = "settings"
            }
        }
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct NavigationButton: View {
    let icon: String
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(label)
                    .font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(isSelected ? .blue : .gray)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
                isSelected ?
                Color.blue.opacity(0.1) :
                Color.clear
            )
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BottomNavigationView(selectedTab: .constant("launcher"))
}