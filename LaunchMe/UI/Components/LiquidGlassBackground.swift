import SwiftUI

struct LiquidGlassBackground: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Base gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    colorScheme == .dark
                        ? Color(red: 0.1, green: 0.1, blue: 0.12)
                        : Color(red: 0.95, green: 0.95, blue: 0.97),
                    colorScheme == .dark
                        ? Color(red: 0.08, green: 0.08, blue: 0.1)
                        : Color(red: 0.98, green: 0.98, blue: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // Animated glass effect overlay
            Canvas { context in
                // Draw animated glass morphism effect
                var path = Path()
                path.addEllipse(in: CGRect(x: -100, y: -100, width: 500, height: 500))
                
                context.fill(
                    path,
                    with: .color(
                        Color.white.opacity(colorScheme == .dark ? 0.05 : 0.1)
                    )
                )
            }
            
            // Blur effect
            .background(
                Image(nsImage: NSImage())
                    .blur(radius: 30)
            )
            
            // Additional glass shine
            VStack(spacing: 0) {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.1),
                        Color.clear
                    ]),
                    startPoint: .top,
                    endPoint: .center
                )
                .frame(height: 200)
                
                Spacer()
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    LiquidGlassBackground()
}