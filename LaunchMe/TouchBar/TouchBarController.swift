import AppKit

class TouchBarController: NSObject, NSTouchBarDelegate {
    let touchBar = NSTouchBar()
    
    override init() {
        super.init()
        setupTouchBar()
    }
    
    private func setupTouchBar() {
        touchBar.delegate = self
        touchBar.customizationIdentifier = "com.launchme.touchbar"
        touchBar.defaultItemIdentifiers = [
            .launcherButton,
            .flexibleSpace,
            .workflowsButton,
            .spacesButton,
            .settingsButton
        ]
        touchBar.customizationAllowedItemIdentifiers = [
            .launcherButton,
            .workflowsButton,
            .spacesButton,
            .settingsButton
        ]
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case .launcherButton:
            return createButton(identifier: identifier, title: "Launcher", image: "square.grid.2x2", target: self, action: #selector(launcherTapped))
            
        case .workflowsButton:
            return createButton(identifier: identifier, title: "Workflows", image: "bolt.fill", target: self, action: #selector(workflowsTapped))
            
        case .spacesButton:
            return createButton(identifier: identifier, title: "Spaces", image: "square.grid.3x2", target: self, action: #selector(spacesTapped))
            
        case .settingsButton:
            return createButton(identifier: identifier, title: "Settings", image: "gear", target: self, action: #selector(settingsTapped))
            
        case .flexibleSpace:
            return NSCustomTouchBarItem(identifier: identifier)
            
        default:
            return nil
        }
    }
    
    private func createButton(identifier: NSTouchBarItem.Identifier, title: String, image: String, target: Any?, action: Selector) -> NSCustomTouchBarItem {
        let item = NSCustomTouchBarItem(identifier: identifier)
        
        let button = NSButton(title: title, target: target, action: action)
        button.bezelStyle = .rounded
        button.controlSize = .regular
        button.setAccessibilityLabel(title)
        
        item.view = button
        return item
    }
    
    @objc func launcherTapped() {
        print("Launcher tapped from Touch Bar")
        NSHapticFeedbackManager.defaultPerformer.perform(.alignment, performanceTime: .default)
    }
    
    @objc func workflowsTapped() {
        print("Workflows tapped from Touch Bar")
        NSHapticFeedbackManager.defaultPerformer.perform(.alignment, performanceTime: .default)
    }
    
    @objc func spacesTapped() {
        print("Spaces tapped from Touch Bar")
        NSHapticFeedbackManager.defaultPerformer.perform(.alignment, performanceTime: .default)
    }
    
    @objc func settingsTapped() {
        print("Settings tapped from Touch Bar")
        NSHapticFeedbackManager.defaultPerformer.perform(.alignment, performanceTime: .default)
    }
}

// MARK: - Touch Bar Item Identifiers
extension NSTouchBarItem.Identifier {
    static let launcherButton = NSTouchBarItem.Identifier("com.launchme.launcher")
    static let workflowsButton = NSTouchBarItem.Identifier("com.launchme.workflows")
    static let spacesButton = NSTouchBarItem.Identifier("com.launchme.spaces")
    static let settingsButton = NSTouchBarItem.Identifier("com.launchme.settings")
}