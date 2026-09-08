import Foundation
import AppKit

class AppLauncher: ObservableObject {
    @Published var apps: [AppItem] = []
    @Published var workflows: [Workflow] = []
    @Published var spaces: [Space] = []
    
    init() {
        loadApps()
        loadWorkflows()
        loadSpaces()
    }
    
    func loadApps() {
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
    
    func loadWorkflows() {
        // Load workflows from UserDefaults or local storage
        workflows = []
    }
    
    func loadSpaces() {
        // Load spaces from UserDefaults or local storage
        spaces = []
    }
    
    func launchApp(_ app: AppItem) {
        do {
            try NSWorkspace.shared.open(
                URL(fileURLWithPath: app.path),
                options: .default,
                configuration: [:]
            )
            print("✅ Launched: \(app.name)")
        } catch {
            print("❌ Failed to launch app: \(error)")
        }
    }
    
    func executeWorkflow(_ workflow: Workflow) {
        for appPath in workflow.apps {
            do {
                try NSWorkspace.shared.open(
                    URL(fileURLWithPath: appPath),
                    options: .default,
                    configuration: [:]
                )
                print("✅ Launched: \(appPath)")
            } catch {
                print("❌ Failed to launch: \(error)")
            }
        }
    }
}

struct AppItem: Identifiable {
    let id = UUID()
    let name: String
    let path: String
    let icon: NSImage
}

struct Workflow: Identifiable {
    let id = UUID()
    let name: String
    let apps: [String]
}

struct Space: Identifiable {
    let id = UUID()
    let name: String
    let apps: [String]
    let wallpaper: String
}