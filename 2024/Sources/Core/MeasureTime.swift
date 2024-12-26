import Foundation

public func measureTime(
    _ closure: () async -> Void
) async {
    let start = Date()
    await closure()
    print("Duration", Date().timeIntervalSince(start))
}
