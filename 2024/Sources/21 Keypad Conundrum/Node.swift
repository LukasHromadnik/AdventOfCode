import Foundation
import Core

final class Node: Comparable, Equatable, HasPredecessor {
    let point: Point
    let orientation: Orientation
    var value: Int
    var predecessor: Node?

    init(point: Point, orientation: Orientation, value: Int = 0, predecessor: Node? = nil) {
        self.point = point
        self.orientation = orientation
        self.value = value
        self.predecessor = predecessor
    }

    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.value < rhs.value
    }

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.point == rhs.point && lhs.orientation == rhs.orientation && lhs.value == rhs.value && lhs.predecessor == rhs.predecessor
    }

    func up() -> Node {
        Node(point: point.up(), orientation: .up)
    }

    func down() -> Node {
        Node(point: point.down(), orientation: .down)
    }

    func left() -> Node {
        Node(point: point.left(), orientation: .left)
    }

    func right() -> Node {
        Node(point: point.right(), orientation: .right)
    }
}
