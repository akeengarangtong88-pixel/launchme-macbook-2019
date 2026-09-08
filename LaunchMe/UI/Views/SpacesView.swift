import SwiftUI

struct SpacesView: View {
    @State private var spaces: [Space] = []
    @State private var selectedSpace: Space?
    @State private var showNewSpace = false
    
    var body: some View {
        VStack {
            List(spaces, selection: $selectedSpace) { space in
                SpaceRow(space: space)
            }
            .listStyle(.plain)
            
            Spacer()
            
            HStack {
                Button(action: { showNewSpace = true }) {
                    Label("New Space", systemImage: "plus.circle.fill")
                }
                .buttonStyle(.borderedProminent)
                
                if let selected = selectedSpace {
                    Button(action: { switchToSpace(selected) }) {
                        Label("Switch", systemImage: "arrow.right.circle.fill")
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showNewSpace) {
            NewSpaceSheet(isPresented: $showNewSpace)
        }
    }
    
    private func switchToSpace(_ space: Space) {
        print("Switching to space: \(space.name)")
        // Implement space switching logic
    }
}

struct Space: Identifiable {
    let id = UUID()
    let name: String
    let apps: [String]
    let icon: String
    let wallpaper: String
}

struct SpaceRow: View {
    let space: Space
    
    var body: some View {
        HStack {
            Image(systemName: space.icon)
                .font(.system(size: 20))
                .foregroundColor(.green)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(space.name)
                    .font(.headline)
                
                Text("\(space.apps.count) apps")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct NewSpaceSheet: View {
    @Binding var isPresented: Bool
    @State private var spaceName = ""
    
    var body: some View {
        VStack {
            Text("Create New Space")
                .font(.headline)
            
            TextField("Space name", text: $spaceName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Spacer()
            
            HStack {
                Button("Cancel") { isPresented = false }
                    .keyboardShortcut(.cancelAction)
                
                Button("Create") { isPresented = false }
                    .keyboardShortcut(.defaultAction)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    SpacesView()
}