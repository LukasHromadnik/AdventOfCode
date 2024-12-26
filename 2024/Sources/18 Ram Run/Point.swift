import Foundation

struct Point: Hashable {
    let i: Int
    let j: Int

    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }

    func up() -> Point {
        Point(i - 1, j)
    }

    func left() -> Point {
        Point(i, j - 1)
    }

    func down() -> Point {
        Point(i + 1, j)
    }

    func right() -> Point {
        Point(i, j + 1)
    }
}
