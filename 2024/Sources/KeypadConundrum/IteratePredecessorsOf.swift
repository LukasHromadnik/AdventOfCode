import Foundation

func iteratePredecessorsOf<T>(
    _ node: T,
    by predecessorKeyPath: KeyPath<T, T?>,
    closure: (T) -> Void
) {
    var predecessor: T! = node
    while predecessor != nil {
        closure(predecessor)
        predecessor = predecessor[keyPath: predecessorKeyPath]
    }
}

protocol HasPredecessor {
    var predecessor: Self? { get }
}

func iteratePredecessorsOf<T: HasPredecessor>(
    _ node: T,
    closure: (T) -> Void
) {
    iteratePredecessorsOf(
        node,
        by: \.predecessor,
        closure: closure
    )
}

