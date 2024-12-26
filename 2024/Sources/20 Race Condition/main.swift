import Foundation

let input = """
###############
#...#...#.....#
#.#.#.#.#.###.#
#S#...#.#.#...#
#######.#.#.###
#######.#.#...#
#######.#.###.#
###..E#...#...#
###.#######.###
#...###...#...#
#.#####.#.###.#
#.#...#.#.#...#
#.#.#.#.#.#.###
#...#...#...###
###############
"""

let cheatSteps = 1

enum Element: String, GridElement {
    case wall = "#"
    case empty = "."
    case start = "S"
    case end = "E"
    case path = "O"
}

class SearchNode {
    let point: Point
    var predecessor: SearchNode?
    var cheatStepsRemaining = cheatSteps

    init(point: Point, predecessor: SearchNode? = nil) {
        self.point = point
        self.predecessor = predecessor
    }
}

var grid = Grid<Element>(input)
let start = grid.find(.start)!
let end = grid.find(.end)!
var endNode: SearchNode!

var queue = [SearchNode(point: start)]
var visited: Set<Point> = []

while !queue.isEmpty {
    let node = queue.removeFirst()

    if node.point == end {
        endNode = node
        break
    }

    guard !visited.contains(node.point) else { continue }
    visited.insert(node.point)

    let next = [
        node.point.up(),
        node.point.right(),
        node.point.down(),
        node.point.left()
    ]
        .filter(grid.contains)
        .filter { grid[$0] != .wall }
        .filter { !visited.contains($0) }

    next.forEach {
        queue.append(SearchNode(point: $0, predecessor: node))
    }
}

// Get full path
var path: [Point] = []
var node: SearchNode! = endNode
while node != nil {
    path.append(node.point)
    node = node.predecessor
}
path.reverse()

var savedSeconds: [Int] = []
for (i, j) in grid.indexes {
    if i == 0 || j == 0 || i == grid.numberOfRows - 1 || j == grid.numberOfColumns - 1 { continue }

    let point = Point(i, j)
    guard grid[point] == .wall else { continue }

    let next = [
        point.up(),
        point.right(),
        point.down(),
        point.left()
    ]
        .filter { grid[$0] == .empty }

    let indexes = next.compactMap { path.firstIndex(of: $0) }

    guard !indexes.isEmpty else { continue }

    let minIndex = indexes.min()!
    let maxIndex = indexes.max()!
    let seconds = maxIndex - minIndex

    guard seconds > 0 else { continue }

    savedSeconds.append(maxIndex - minIndex)
}

print(savedSeconds.sorted())

//for i in 0..<path.count {
//    let point = path[i]
//    print()
//    print("POINT:", point)
//
//    var queue = [
//        point.up(),
//        point.right(),
//        point.down(),
//        point.left()
//    ]
//        .filter { grid[$0] == .wall }
//        .map {
//            let node = SearchNode(point: $0)
//            node.cheatStepsRemaining -= 1
//            return node
//        }
//    print("QUEUE:", queue.map(\.point))
//
//    var visited: Set<Point> = []
//
//    while !queue.isEmpty {
//        let node = queue.removeFirst()
//        print("POP:", node.point, grid[node.point])
//
//        if grid[node.point] == .empty {
//            let index = path.firstIndex(of: node.point)!
//            print("INDEX:", index, "(\(i))")
//            if index <= i { continue }
//            savedSeconds.append(index - i)
//            continue
//        }
//
//        if grid[node.point] == .start { continue }
//
//        guard !visited.contains(node.point) else { continue }
//        visited.insert(node.point)
//
//        var currentPath = Set<Point>()
//        var previous: SearchNode! = node
//        while previous != nil {
//            currentPath.insert(previous.point)
//            previous = previous.predecessor
//        }
//        let nextPoints = [
//            node.point.up(),
//            node.point.right(),
//            node.point.down(),
//            node.point.left()
//        ]
//            .filter(grid.contains)
//            .filter { !visited.contains($0) }
//            .filter { !currentPath.contains($0) }
//            .filter { !path.prefix(i + 1).contains($0) }
//
//        let next = nextPoints
//            .compactMap { point -> SearchNode? in
//                if node.cheatStepsRemaining == 0 && grid[point] == .wall { return nil }
//
//                let nextNode = SearchNode(point: point, predecessor: node)
//                nextNode.cheatStepsRemaining = node.cheatStepsRemaining - 1
//
//                return nextNode
//            }
//
//        let nextEmpty = next.filter { grid[$0.point] == .empty }
//            .max { n1, n2 in
//                let i1 = path.firstIndex { $0 == n1.point }!
//                let i2 = path.firstIndex { $0 == n2.point }!
//                return i1 < i2
//            }
//        if let nextEmpty { queue.append(nextEmpty) }
//
//        next.filter { grid[$0.point] != .empty }.forEach { queue.append($0) }
//    }
//}
//print(savedSeconds.map { $0 - 2 }.filter { $0 >= 100 }.count)
//print(savedSeconds)

