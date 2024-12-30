import Foundation
import Core

let numberOfCheatSteps = 20
var grid = Grid<String>(mainInput)
let start = grid.find("S")!
let end = grid.find("E")!
var endNode: SearchNode!

var queue = [SearchNode(point: start)]
var visited: Set<Point> = []

// Get full path
while !queue.isEmpty {
    let node = queue.removeFirst()

    if node.point == end {
        endNode = node
        break
    }

    guard !visited.contains(node.point) else { continue }
    visited.insert(node.point)

    let next = node.neighbors()
        .filter { n in grid.contains(n.point)}
        .filter { grid[$0.point] != "#" }
        .filter { n in !visited.contains { $0 == n.point } }

    next.forEach {
        queue.append($0)
    }
}

// Build path
let path = Array(mapPredecessorsOf(endNode) { $0.point }.reversed())
print("Path found")

var saved: [Int] = []

for i in 0..<path.count - numberOfCheatSteps {
    for j in (i + 1)..<path.count {
        let distance = abs(path[j].i - path[i].i) + abs(path[j].j - path[i].j)
        if distance <= numberOfCheatSteps && i + distance < j {
            saved.append(j - i - distance)
        }
    }
}
//print(saved.sorted())
//print(saved.filter { $0 >= 50 }.sorted())
print(saved.filter { $0 >= 100 }.count)
