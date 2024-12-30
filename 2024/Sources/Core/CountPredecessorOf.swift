import Foundation

public func countPredecessorsOf<T>(
    _ node: T,
    by predecessorKeyPath: KeyPath<T, T?>
) -> Int {
    mapPredecessorsOf(node, by: predecessorKeyPath) { _ in 1 }.reduce(0, +)
}

public func countPredecessorsOf<T: HasPredecessor>(
    _ node: T
) -> Int {
    countPredecessorsOf(
        node,
        by: \.predecessor
    )
}
