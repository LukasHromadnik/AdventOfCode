import Foundation

public struct Point: Hashable {
    public let i: Int
    public let j: Int

    public init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }

    public func up() -> Point {
        Point(i - 1, j)
    }

    public func left() -> Point {
        Point(i, j - 1)
    }

    public func down() -> Point {
        Point(i + 1, j)
    }

    public func right() -> Point {
        Point(i, j + 1)
    }

    public func neighbors() -> [Point] {
        [up(), left(), down(), right()]
    }
}

extension Point: CustomStringConvertible {
    public var description: String {
        "[\(i), \(j)]"
    }
}
