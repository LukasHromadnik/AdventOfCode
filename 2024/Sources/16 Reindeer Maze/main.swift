import Foundation
import Collections

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

    func isInBounds(of grid: [[String]]) -> Bool {
        i >= 0 && i < grid.count && j >= 0 && j < grid[0].count
    }
}

enum Orientation: String, CaseIterable {
    case up = "^"
    case left = "<"
    case down = "v"
    case right = ">"
}

class Node: Hashable, Comparable, CustomStringConvertible {
    let point: Point
    let orientation: Orientation
    let value: Int
    var predecessors: [Node] = []

    init(point: Point, orientation: Orientation, value: Int) {
        self.point = point
        self.orientation = orientation
        self.value = value
    }

    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.value < rhs.value
    }

    func up() -> Node {
        Node(point: point.up(), orientation: .up, value: value + (orientation == .up ? 1 : 1_001))
    }

    func left() -> Node {
        Node(point: point.left(), orientation: .left, value: value + (orientation == .left ? 1 : 1_001))
    }

    func down() -> Node {
        Node(point: point.down(), orientation: .down, value: value + (orientation == .down ? 1 : 1_001))
    }

    func right() -> Node {
        Node(point: point.right(), orientation: .right, value: value + (orientation == .right ? 1 : 1_001))
    }

    var description: String {
        "\(point) \(orientation.rawValue) \(value)"
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(point)
        hasher.combine(orientation)
        hasher.combine(value)
    }

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.point == rhs.point && lhs.orientation == rhs.orientation && lhs.value == rhs.value && lhs.predecessors == rhs.predecessors
    }

    var searchNode: SearchNode {
        SearchNode(point: point, orientation: orientation)
    }
}

let input = """
###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############
"""

let input2 = """
#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################
"""

struct SearchNode: Hashable {
    let point: Point
    let orientation: Orientation
}

func solve(_ input: String) -> Int {
    let grid = input.components(separatedBy: "\n").map { Array($0).map(String.init) }
    var startPoint: Point!
    for i in 0..<grid.count {
        for j in 0..<grid.count {
            if grid[i][j] == "S" {
                startPoint = Point(i, j)
            }
        }
    }

    let startNode = Node(point: startPoint, orientation: .right, value: 0)
    var heap = Heap<Node>([startNode])
    var minValue = Int.max
    var visited = Set<Node>()
    var values: [SearchNode: Int] = [:]
    var endNode: Node!

//    var numberOfIterations = 0
    while let minNode = heap.popMin() {
//        numberOfIterations += 1
        if grid[minNode.point.i][minNode.point.j] == "E" {
            minValue = min(minValue, minNode.value)
            endNode = minNode
            continue
        }

        if minNode.value > minValue { continue }

        if visited.contains(minNode) { continue }
        visited.insert(minNode)

        let value = values[minNode.searchNode] ?? .max
        if minNode.value > value { continue }
        values[minNode.searchNode] = minNode.value

        let nextNodes = [
            minNode.up(),
            minNode.left(),
            minNode.down(),
            minNode.right()
        ]
            .filter { $0.point.isInBounds(of: grid) }
            .filter { grid[$0.point.i][$0.point.j] != "#" }
            .filter { $0.value <= (values[$0.searchNode] ?? .max) }

        nextNodes.forEach { node in
            if let previous = heap.unordered.first(where: { $0.point == node.point && $0.orientation == node.orientation && $0.value == node.value }) {
                previous.predecessors.append(minNode)
            } else {
                heap.insert(node)
                node.predecessors = [minNode]
            }
        }
    }

    let predecessors = Set(findPredecesors(endNode) + [endNode.point])
    print(predecessors.count)

//    print(numberOfIterations)
    return minValue
}

func findPredecesors(_ node: Node) -> [Point] {
    let predecessors = node.predecessors
    return predecessors.map(\.point) + predecessors.flatMap(findPredecesors)
}

//assert(solve(input) == 7036)
//assert(solve(input2) == 11048)
assert(solve(mainInput) == 99460)
