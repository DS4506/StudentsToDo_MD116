import SwiftUI

struct TaskGroupDetailView: View {

    @Binding var group: TaskGroup
    @FocusState private var focusedTaskID: UUID?

    var appAccentColor: Color

    private var completionPercentage: Double {
        group.completionRate
    }

    private var completionText: String {
        let completed = group.completedTaskCount
        let remaining = group.remainingTaskCount
        if group.tasks.isEmpty {
            return "No tasks yet"
        } else {
            return "\(completed) completed, \(remaining) remaining"
        }
    }

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text(group.title)
                        .font(.title2.bold())
                        .foregroundStyle(appAccentColor)

                    HStack {
                        Image(systemName: group.symbolName)
                            .foregroundStyle(appAccentColor)
                        Text("Completion Progress")
                            .font(.headline)
                    }

                    ProgressView(value: completionPercentage)
                        .tint(group.tasks.isEmpty ? .gray : appAccentColor)
                        .animation(.snappy, value: completionPercentage)

                    Text(completionText)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 8)
            }

            Section {
                ForEach($group.tasks) { $task in
                    TaskRow(
                        task: $task,
                        focusedTaskID: $focusedTaskID,
                        appAccentColor: appAccentColor
                    )
                }
                .onDelete(perform: deleteTask)
            } header: {
                Text("Tasks")
                    .font(.headline)
                    .foregroundStyle(appAccentColor)
            }
        }
        .overlay {
            if group.tasks.isEmpty {
                ContentUnavailableView(
                    "No Tasks Yet",
                    systemImage: "list.bullet.clipboard",
                    description: Text("Tap the plus button to add your first task.")
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    addNewTask()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline.weight(.bold))
                        .foregroundStyle(appAccentColor)
                        .padding(6)
                        .background(appAccentColor.opacity(0.15))
                        .clipShape(Circle())
                }
            }
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        group.tasks.remove(atOffsets: offsets)
    }

    private func addNewTask() {
        withAnimation {
            let newTask = TaskItem(title: "", isCompleted: false)
            group.tasks.append(newTask)
            focusedTaskID = newTask.id
        }
    }
}

struct TaskRow: View {
    @Binding var task: TaskItem

    var focusedTaskID: FocusState<UUID?>.Binding

    var appAccentColor: Color

    var body: some View {
        HStack(spacing: 12) {
            // Complete / incomplete checkbox
            Button {
                withAnimation(.snappy) {
                    task.isCompleted.toggle()
                }
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(task.isCompleted ? appAccentColor : .secondary)
            }
            .buttonStyle(.plain)

            // Task title
            TextField("New Task", text: $task.title)
                .strikethrough(task.isCompleted, color: .secondary)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)
                .focused(focusedTaskID, equals: task.id)
                .onSubmit {
                    focusedTaskID.wrappedValue = nil
                }

            Spacer()

            // Priority selector
            Menu {
                Picker("Priority", selection: $task.priority) {
                    ForEach(TaskPriority.allCases, id: \.self) { priority in
                        Text(priority.displayName).tag(priority)
                    }
                }
            } label: {
                HStack(spacing: 6) {
                    Circle()
                        .fill(task.priority.color)
                        .frame(width: 10, height: 10)
                    Text(task.priority.displayName)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
            }
        }
        .padding(.vertical, 8)
    }
}
