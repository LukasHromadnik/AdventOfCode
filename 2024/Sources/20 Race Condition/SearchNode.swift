import Foundation
import Core

final class SearchNode: HasPredecessor {
    let point: Point
    var predecessor: SearchNode?

    init(point: Point, predecessor: SearchNode? = nil) {
        self.point = point
        self.predecessor = predecessor
    }

    func neighbors() -> [SearchNode] {
        point.neighbors().map {
            SearchNode(point: $0, predecessor: self)
        }
    }
}

extension SearchNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(point)
        iteratePredecessorsOf(self) {
            hasher.combine($0.point)
        }
    }

    static func == (lhs: SearchNode, rhs: SearchNode) -> Bool {
        lhs.point == rhs.point && lhs.predecessor == rhs.predecessor
    }
}
