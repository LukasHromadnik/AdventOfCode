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

    public func upLeft() -> Point {
        Point(i - 1, j - 1)
    }

    public func upRight() -> Point {
        Point(i - 1, j + 1)
    }

    public func downLeft() -> Point {
        Point(i + 1, j - 1)
    }

    public func downRight() -> Point {
        Point(i + 1, j + 1)
    }

    // Previously neighbors
    public func neighbors4() -> [Point] {
        [up(), left(), down(), right()]
    }

    public func neighbors8() -> [Point] {
        [up(), left(), down(), right(), upLeft(), upRight(), downLeft(), downRight()]
    }
}

extension Point: CustomStringConvertible {
    public var description: String {
        "[\(i), \(j)]"
    }
}
