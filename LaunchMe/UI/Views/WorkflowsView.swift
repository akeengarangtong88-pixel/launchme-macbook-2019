import SwiftUI

struct WorkflowsView: View {
    @State private var workflows: [Workflow] = []
    @State private var showNewWorkflow = false
    
    var body: some View {
        VStack {
            List {
                ForEach(workflows) { workflow in
                    WorkflowRow(workflow: workflow)
                }
            }
            .listStyle(.plain)
            
            Spacer()
            
            Button(action: { showNewWorkflow = true }) {
                Label("New Workflow", systemImage: "plus.circle.fill")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .sheet(isPresented: $showNewWorkflow) {
            NewWorkflowSheet(isPresented: $showNewWorkflow)
        }
    }
}

struct Workflow: Identifiable {
    let id = UUID()
    let name: String
    let apps: [String]
    let icon: String
}

struct WorkflowRow: View {
    let workflow: Workflow
    
    var body: some View {
        HStack {
            Image(systemName: workflow.icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(workflow.name)
                    .font(.headline)
                
                Text("\(workflow.apps.count) apps")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: { executeWorkflow(workflow) }) {
                Image(systemName: "play.fill")
                    .foregroundColor(.blue)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
    }
    
    private func executeWorkflow(_ workflow: Workflow) {
        for appName in workflow.apps {
            // Launch each app in workflow
            print("Launching: \(appName)")
        }
    }
}

struct NewWorkflowSheet: View {
    @Binding var isPresented: Bool
    @State private var workflowName = ""
    
    var body: some View {
        VStack {
            Text("Create New Workflow")
                .font(.headline)
            
            TextField("Workflow name", text: $workflowName)
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
    WorkflowsView()
}