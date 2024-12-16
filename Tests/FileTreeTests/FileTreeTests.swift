import Testing
@testable import FileTree

@Test func example() async throws {
    print(FileTree().tree)
}
