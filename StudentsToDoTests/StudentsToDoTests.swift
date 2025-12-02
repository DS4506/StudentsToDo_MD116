import Testing
@testable import StudentsToDo

struct StudentsToDoTests {

    // Step 1: Test that a task can have a priority
    @Test func testTaskHasPriority() throws {
        var task = TaskItem(title: "Complete Homework")
        task.priority = .high

        #expect(task.priority == .high)
    }

    // Optional extra test: check the default priority
    @Test func testDefaultTaskPriorityIsMedium() throws {
        let task = TaskItem(title: "Read chapter 3")

        #expect(task.priority == .medium)
    }
}
