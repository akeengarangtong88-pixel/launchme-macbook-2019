# LaunchMe Setup Guide for MacBook Pro 13 2019

## Prerequisites

- **Mac Model:** MacBook Pro 13" 2019
- **macOS Version:** 15.7.9 or later
- **Xcode:** 15.0 or later
- **Swift:** 5.9 or later

## Installation Steps

### 1. Clone Repository
```bash
git clone https://github.com/akeengarangtong88-pixel/launchme-macbook-2019.git
cd launchme-macbook-2019
```

### 2. Verify Xcode Installation
```bash
xcode-select --install
```

### 3. Build the App
```bash
make build
```

Or manually:
```bash
xcodebuild -scheme LaunchMe -configuration Release
```

### 4. Run the App
```bash
make run
```

### 5. Install to Applications
```bash
make install
```

Or manually:
```bash
cp -r build/Release/LaunchMe.app /Applications/LaunchMe.app
```

## Enabling Touch Bar Features

### 1. System Preferences Setup
1. Open **System Preferences**
2. Go to **Keyboard** → **Customize Touch Bar**
3. Ensure LaunchMe is added to Control Strip
4. Configure app-specific Touch Bar icons

### 2. Grant Permissions
The app may need the following permissions:
- **Accessibility** - for app launching
- **Files and Folders** - for accessing /Applications

To grant permissions:
1. Go to **System Preferences** → **Security & Privacy**
2. Click **Accessibility**
3. Add LaunchMe to the list

### 3. Verify Touch Bar Recognition

After launching the app, your MacBook Pro 2019 Touch Bar should display:
- 🚀 **Launcher Button** - Quick access to app grid
- ⚡ **Workflows Button** - Launch workflow combinations
- 📱 **Spaces Button** - Switch between workspaces
- ⚙️ **Settings Button** - Open preferences

## Customizing the App

### Change Theme
1. Open **LaunchMe** → **Settings**
2. Select "Appearance" → Choose theme (Liquid Glass, Flat, Dark, Light)

### Add Apps to Launcher
1. In the **Launcher** tab, apps auto-load from `/Applications`
2. Drag and drop to reorder
3. Right-click to hide apps

### Create Workflows
1. Go to **Workflows** tab
2. Click **New Workflow**
3. Add apps to the workflow
4. Save and access from Touch Bar

### Create Spaces
1. Go to **Spaces** tab
2. Click **New Space**
3. Configure apps and wallpaper for the space
4. Switch between spaces using Touch Bar or keyboard shortcut

## Troubleshooting

### Touch Bar Not Showing Buttons
**Solution:**
1. Restart LaunchMe
2. Go to **System Preferences** → **Keyboard** → **Touch Bar**
3. Ensure custom Touch Bar items are enabled
4. Reset Touch Bar: Hold `Shift+Option+Cmd` and tap Touch Bar

### App Won't Launch
**Solution:**
1. Verify app is in `/Applications` folder
2. Check app is not in Quarantine: `xattr -l /Applications/AppName.app`
3. Remove quarantine: `xattr -d com.apple.quarantine /Applications/AppName.app`

### Liquid Glass Blur Not Visible
**Solution:**
1. Ensure macOS 15.7.9+
2. Check GPU acceleration is enabled
3. Disable other visual effects that may conflict
4. Try switching themes in Settings

### Permission Denied Errors
**Solution:**
1. Open **System Preferences** → **Security & Privacy** → **Accessibility**
2. Click the lock icon and enter your password
3. Add LaunchMe to the list of allowed apps

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Cmd + Space` | Toggle LaunchMe (customizable) |
| `Cmd + 1` | Go to Launcher tab |
| `Cmd + 2` | Go to Workflows tab |
| `Cmd + 3` | Go to Spaces tab |
| `Cmd + 4` | Go to Settings tab |
| `Cmd + ,` | Open Preferences |
| `Cmd + Q` | Quit LaunchMe |

## Performance Tips

1. **Limit Apps in Grid** - Too many apps may slow down rendering
2. **Disable Animations** - For older MacBook Pros
3. **Reduce Blur Effect** - Lower blur amount in Settings
4. **Close Unused Workflows** - They consume memory

## Advanced Configuration

### Edit Touch Bar Buttons
Edit `LaunchMe/TouchBar/TouchBarController.swift` to customize buttons:
```swift
touchBar.defaultItemIdentifiers = [
    .launcherButton,
    .flexibleSpace,
    .workflowsButton,
    .spacesButton,
    .settingsButton
]
```

### Change Liquid Glass Effect
Modify blur in `LaunchMe/UI/Components/LiquidGlassBackground.swift`:
```swift
.blur(radius: 30)  // Change 30 to desired blur amount
```

### Configure Grid Layout
Edit grid columns in `LaunchMe/UI/Components/AppGridView.swift`:
```swift
let columns = [
    GridItem(.adaptive(minimum: 100), spacing: 20)
]
```

## Support

For issues and feature requests:
- 📝 Create an issue: https://github.com/akeengarangtong88-pixel/launchme-macbook-2019/issues
- 🤝 Submit a PR: https://github.com/akeengarangtong88-pixel/launchme-macbook-2019/pulls
- 📧 Contact: Open an issue on GitHub

## License

MIT License - See LICENSE file for details

---

**Made with ❤️ for MacBook Pro 13 2019 users**