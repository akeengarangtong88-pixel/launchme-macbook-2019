# LaunchMe - MacBook Pro 13 2019 Touch Bar Edition

A modern, customizable app launcher for macOS 15.7.9+ featuring a stunning Liquid Glass UI, Touch Bar integration, and powerful workflows for your MacBook Pro 13 2019.

## 🎨 Features

### Liquid Glass UI
- Glassmorphism design with frosted glass effects
- Smooth blur backgrounds with transparency
- Modern, sleek aesthetic
- Adaptive Dark/Light mode support
- Smooth animations and transitions

### 📱 Touch Bar Integration
- Custom Touch Bar buttons for quick app launching
- Workspace switcher controls on Touch Bar
- Workflow access via Touch Bar
- Haptic feedback on interactions
- Touch Bar preview support

### 🚀 Core Features
- **Customizable App Grid** - Organize apps with drag-and-drop
- **Themes & Wallpapers** - Liquid Glass and Flat themes with dynamic wallpapers
- **Folders & Navigation** - Quick access to any folder on your Mac
- **Keyboard Shortcuts** - Custom hotkeys for instant access
- **Workflows** - Launch multiple apps with one click
- **Spaces** - Separate workspaces for different tasks
- **Widgets** - Calendar, clock, and custom widgets
- **Icon Customization** - Change sizes, styles, and appearances

## 🔧 System Requirements

- **Mac Model:** MacBook Pro 13" 2019
- **OS:** macOS 15.7.9 or later
- **RAM:** 4GB minimum (8GB recommended)
- **Storage:** 500MB

## 📦 Installation

### From Source
```bash
git clone https://github.com/akeengarangtong88-pixel/launchme-macbook-2019.git
cd launchme-macbook-2019
```

### Build
```bash
xcodebuild -scheme LaunchMe -configuration Release
```

### Run
```bash
open build/Release/LaunchMe.app
```

## 🎯 Quick Start

1. **Launch the App** - Open LaunchMe from Applications
2. **Add Your Apps** - Drag and drop apps to the grid
3. **Customize** - Click settings to change themes and colors
4. **Touch Bar Setup** - Configure Touch Bar buttons in preferences
5. **Create Workflows** - Set up app workflows for quick launches

## 🛠️ Development

### Tech Stack
- **Language:** Swift
- **Framework:** SwiftUI + AppKit
- **Graphics:** Metal (for Liquid Glass effects)
- **Touch Bar:** NSTouchBar API

### Project Structure
```
launchme-macbook-2019/
├── LaunchMe/
│   ├── App/
│   ├── UI/
│   │   ├── Views/
│   │   ├── Components/
│   │   └── Styles/
│   ├── Models/
│   ├── Services/
│   ├── TouchBar/
│   └── Shaders/
├── LaunchMeTests/
└── Resources/
    └── Assets
```

### Building from Xcode
```bash
open LaunchMe.xcodeproj
# Then press Cmd+B to build
# Press Cmd+R to run
```

## 📝 Configuration

### Touch Bar Customization
Edit `LaunchMe/TouchBar/TouchBarController.swift` to customize Touch Bar buttons.

### Liquid Glass Settings
Modify shader properties in `LaunchMe/Shaders/LiquidGlass.metal`

### App Launcher Grid
Configure grid layout in `LaunchMe/Models/AppLauncher.swift`

## 🐛 Troubleshooting

### Touch Bar not responding?
- Restart LaunchMe
- Check System Preferences > Keyboard > Customize Touch Bar
- Ensure Touch Bar is enabled in System Settings

### Liquid Glass blur not visible?
- Verify you're on macOS 15.7.9+
- Check GPU acceleration is enabled
- Update graphics drivers

### App won't launch?
- Verify app permissions in System Preferences
- Check app is not in quarantine
- Try running from Applications folder

## 📄 License

MIT License - See LICENSE file for details

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📞 Support

For issues and feature requests, please visit:
[GitHub Issues](https://github.com/akeengarangtong88-pixel/launchme-macbook-2019/issues)

## 🙏 Acknowledgments

- Inspired by the official LaunchMe app
- Touch Bar optimization for 2019 MacBook Pro models
- Community feedback and contributions

---

**Made with ❤️ for MacBook Pro 13 2019 users**