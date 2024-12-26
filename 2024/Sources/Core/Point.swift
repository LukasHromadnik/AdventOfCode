import Foundation

public struct Point: Hashable {
    let i: Int
    let j: Int

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
}
