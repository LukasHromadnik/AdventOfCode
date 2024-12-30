import Foundation

public func mapPredecessorsOf<T, Value>(
    _ node: T,
    by predecessorKeyPath: KeyPath<T, T?>,
    closure: (T) -> Value
) -> [Value] {
    var predecessor: T! = node
    var values: [Value] = []
    while predecessor != nil {
        values.append(closure(predecessor))
        predecessor = predecessor[keyPath: predecessorKeyPath]
    }
    return values
}

public func mapPredecessorsOf<T: HasPredecessor, Value>(
    _ node: T,
    closure: (T) -> Value
) -> [Value] {
    mapPredecessorsOf(
        node,
        by: \.predecessor,
        closure: closure
    )
}
