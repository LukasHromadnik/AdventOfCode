import Foundation

@discardableResult
public func measureTime(
    _ closure: () async -> Void
) async -> TimeInterval {
    let start = Date()
    await closure()
    let duration = Date().timeIntervalSince(start)
    print("Duration", duration)
    return duration
}
