import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTheme = "liquid-glass"
    @State private var enableTouchBar = true
    @State private var enableHaptics = true
    @State private var gridSize: Double = 100
    @State private var blurAmount: Double = 30
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $selectedTheme) {
                        Text("Liquid Glass").tag("liquid-glass")
                        Text("Flat").tag("flat")
                        Text("Dark").tag("dark")
                        Text("Light").tag("light")
                    }
                    
                    Slider(value: $blurAmount, in: 0...50)
                    HStack {
                        Text("Blur Effect")
                        Spacer()
                        Text("\(Int(blurAmount))")
                            .foregroundColor(.gray)
                    }
                    
                    Toggle("Dark Mode", isOn: .constant(colorScheme == .dark))
                        .disabled(true)
                }
                
                Section(header: Text("Touch Bar")) {
                    Toggle("Enable Touch Bar", isOn: $enableTouchBar)
                    
                    Toggle("Haptic Feedback", isOn: $enableHaptics)
                    
                    Text("Touch Bar Configuration")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Section(header: Text("Grid")) {
                    Slider(value: $gridSize, in: 60...150)
                    HStack {
                        Text("Icon Size")
                        Spacer()
                        Text("\(Int(gridSize))px")
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("System")) {
                    HStack {
                        Text("macOS Version")
                        Spacer()
                        Text("15.7.9")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Build")
                        Spacer()
                        Text("2019-TB")
                            .foregroundColor(.gray)
                    }
                }
                
                Section {
                    Button(action: { resetSettings() }) {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text("Reset to Defaults")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    private func resetSettings() {
        selectedTheme = "liquid-glass"
        enableTouchBar = true
        enableHaptics = true
        gridSize = 100
        blurAmount = 30
    }
}

#Preview {
    SettingsView()
}