import SwiftUI

struct ContentView: View {
    @State private var apps: [AppItem] = []
    @State private var selectedTab: String = "launcher"
    
    var body: some View {
        ZStack {
            // Liquid Glass Background
            LiquidGlassBackground()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HeaderView()
                    .padding()
                
                Divider()
                    .opacity(0.1)
                
                // Main Content
                TabView(selection: $selectedTab) {
                    // Launcher Tab
                    AppGridView(apps: $apps)
                        .tag("launcher")
                    
                    // Workflows Tab
                    WorkflowsView()
                        .tag("workflows")
                    
                    // Spaces Tab
                    SpacesView()
                        .tag("spaces")
                    
                    // Settings Tab
                    SettingsView()
                        .tag("settings")
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Bottom Navigation
                BottomNavigationView(selectedTab: $selectedTab)
                    .padding()
                    .background(Color.black.opacity(0.1))
            }
        }
        .onAppear {
            loadApps()
        }
    }
    
    private func loadApps() {
        // Load installed applications
        let fileManager = FileManager.default
        let applicationsURL = URL(fileURLWithPath: "/Applications")
        
        do {
            let appURLs = try fileManager.contentsOfDirectory(at: applicationsURL, includingPropertiesForKeys: nil)
            apps = appURLs
                .filter { $0.pathExtension == "app" }
                .compactMap { appURL in
                    let name = appURL.lastPathComponent.replacingOccurrences(of: ".app", with: "")
                    let icon = NSWorkspace.shared.icon(forFile: appURL.path)
                    return AppItem(name: name, path: appURL.path, icon: icon)
                }
                .sorted { $0.name < $1.name }
        } catch {
            print("Error loading apps: \(error)")
        }
    }
}

struct AppItem: Identifiable {
    let id = UUID()
    let name: String
    let path: String
    let icon: NSImage
}

#Preview {
    ContentView()
}