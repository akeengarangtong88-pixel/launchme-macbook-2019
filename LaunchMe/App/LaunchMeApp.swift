import SwiftUI
import AppKit

@main
struct LaunchMeApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 800, minHeight: 600)
        }
        .windowStyle(.hiddenTitleBar)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var mainWindow: NSWindow?
    var touchBarController: TouchBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMainWindow()
        setupTouchBar()
        setupMenuBar()
    }
    
    private func setupMainWindow() {
        if let window = NSApplication.shared.windows.first {
            mainWindow = window
            window.titlebarAppearsTransparent = true
            window.isOpaque = false
            window.backgroundColor = NSColor.clear
            window.styleMask.insert(.fullSizeContentView)
        }
    }
    
    private func setupTouchBar() {
        touchBarController = TouchBarController()
    }
    
    private func setupMenuBar() {
        let menu = NSMenu()
        
        // App Menu
        let appMenu = NSMenuItem()
        appMenu.submenu = NSMenu()
        appMenu.submenu?.items = [
            NSMenuItem(title: "About LaunchMe", action: #selector(showAbout), keyEquivalent: ""),
            NSMenuItem.separator(),
            NSMenuItem(title: "Preferences...", action: #selector(showPreferences), keyEquivalent: ","),
            NSMenuItem.separator(),
            NSMenuItem(title: "Quit LaunchMe", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        ]
        menu.addItem(appMenu)
        
        NSApplication.shared.mainMenu = menu
    }
    
    @objc func showAbout() {
        NSApplication.shared.orderFrontStandardAboutPanel(self)
    }
    
    @objc func showPreferences() {
        print("Opening preferences...")
    }
}