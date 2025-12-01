import Foundation
import SwiftUI

// MARK: - Single Task

struct TaskItem: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var creationDate: Date

    init(id: UUID = UUID(),
         title: String,
         isCompleted: Bool = false,
         creationDate: Date = Date()) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.creationDate = creationDate
    }
}

// MARK: - Group of Tasks

struct TaskGroup: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var symbolName: String
    var tasks: [TaskItem]

    init(id: UUID = UUID(),
         title: String,
         symbolName: String,
         tasks: [TaskItem] = []) {
        self.id = id
        self.title = title
        self.symbolName = symbolName
        self.tasks = tasks
    }

    /// How many tasks are completed in this group.
    var completedTaskCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    /// How many tasks are still open in this group.
    var remainingTaskCount: Int {
        tasks.count - completedTaskCount
    }

    /// A value from 0.0 to 1.0 representing completion progress.
    var completionRate: Double {
        guard !tasks.isEmpty else { return 0 }
        return Double(completedTaskCount) / Double(tasks.count)
    }

    /// A user-friendly text summary of completion.
    var completionSummaryText: String {
        if tasks.isEmpty {
            return "No tasks yet"
        } else {
            return "\(completedTaskCount) of \(tasks.count) completed"
        }
    }
}

// MARK: - Profile Card Model

struct ProfileCategory: Identifiable {
    let id = UUID()
    let name: LocalizedStringKey
    let imageName: String
    let storageKey: String
}

// MARK: - Sidebar Selection

enum SidebarSelection: Hashable {
    case group(TaskGroup.ID)
    case profile
}
