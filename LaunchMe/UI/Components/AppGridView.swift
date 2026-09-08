import SwiftUI

struct AppGridView: View {
    @Binding var apps: [AppItem]
    @State private var selectedApp: AppItem?
    @State private var draggedApp: AppItem?
    
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 20)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(apps) { app in
                    AppTileView(app: app, isSelected: selectedApp?.id == app.id)
                        .onTapGesture {
                            launchApp(app)
                        }
                        .onDrag {
                            draggedApp = app
                            return NSItemProvider(object: app.path as NSString)
                        }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func launchApp(_ app: AppItem) {
        do {
            try NSWorkspace.shared.open(URL(fileURLWithPath: app.path), options: .default, configuration: [:])
            print("Launched: \(app.name)")
        } catch {
            print("Failed to launch app: \(error)")
        }
    }
}

struct AppTileView: View {
    let app: AppItem
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            // App Icon
            Image(nsImage: app.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.1))
                        .backdrop()
                )
            
            // App Name
            Text(app.name)
                .font(.system(size: 12, weight: .medium))
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .frame(maxWidth: 100)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isSelected ? Color.blue.opacity(0.2) : Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? Color.blue.opacity(0.5) : Color.clear, lineWidth: 1)
        )
    }
}

// MARK: - Glass Effect Modifier
extension View {
    func backdrop() -> some View {
        self
            .background(.ultraThinMaterial)
            .cornerRadius(12)
    }
}

#Preview {
    AppGridView(apps: .constant([
        AppItem(name: "Safari", path: "/Applications/Safari.app", icon: NSImage(named: "AppIcon") ?? NSImage()),
        AppItem(name: "Mail", path: "/Applications/Mail.app", icon: NSImage(named: "AppIcon") ?? NSImage()),
        AppItem(name: "Finder", path: "/System/Library/CoreServices/Finder.app", icon: NSImage(named: "AppIcon") ?? NSImage())
    ]))
}