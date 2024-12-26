import Foundation
import Collections

let input = """
5,4
4,2
4,5
3,0
2,1
6,3
2,4
1,5
0,6
3,3
2,6
5,1
1,2
5,5
2,5
6,5
1,4
0,4
6,4
1,1
6,1
1,0
0,5
1,6
2,0
"""
class SearchNode {
    let point: Point
    var predecessor: SearchNode?

    init(point: Point, predecessor: SearchNode? = nil) {
        self.point = point
        self.predecessor = predecessor
    }
}

enum Element: String, GridElement {
    case empty = "."
    case wall = "#"
    case path = "O"
}

let points = mainInput.components(separatedBy: "\n")
    .map {
        let c = $0.split(separator: ",").map(String.init).compactMap(Int.init)
        return Point(c[1], c[0])
    }

//let gridSize = 7
let gridSize = 71
//let start = 0
let start = 1024
var _grid = Array(repeating: Array(repeating: ".", count: gridSize).joined(), count: gridSize).joined(separator: "\n")

outer: for i in start..<points.count {
    print(i)
    var grid = Grid<Element>(_grid)

    points.prefix(i).forEach {
        grid[$0] = .wall
    }

    var queue: [SearchNode] = []
    queue.append(SearchNode(point: Point(0, 0)))
    var visited: Set<Point> = []

    while !queue.isEmpty {
        let node = queue.removeFirst()
        if node.point == Point(gridSize - 1, gridSize - 1) {
            continue outer
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

    print(grid)
    print(i)
    print(points[i - 1])
    break
}

// PART 1
/*
var node: SearchNode! = endNode
var path: [Point] = []
while node != nil {
//    grid[node.point] = .path
    path.append(node.point)
    node = node.predecessor
}
print(path.count - 1)
//print(grid)
*/
