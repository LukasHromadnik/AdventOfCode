import Foundation

struct Node: Hashable {
    let value: Int
    let x: Int
    let y: Int
    let direction: Int
}

let input = """
2413432311329
3215453535623
3255245654254
3446585845452
4546657867536
1438598798454
4457876987766
3637877979653
4654967986887
4564679986453
1224686865563
2546548887735
4322674655533
"""

let input2 = """
111111111111
999999999991
999999999991
999999999991
999999999991
"""

let lines = mainInput.components(separatedBy: "\n").map(Array.init).map { $0.map(String.init).compactMap(Int.init) }
var visited = Set<Node>()
var queue = PriorityQueue<Node>(order: { $0.value > $1.value })
queue.push(Node(value: 0, x: 0, y: 0, direction: 0))
queue.push(Node(value: 0, x: 0, y: 0, direction: 1))

while !queue.isEmpty {
//    queue.forEach { print($0) }
//    print("---")
    let node = queue.pop()!
//    print(node)

    if visited.contains(node) {
//        print("visited")
        continue
    }

    if node.x == lines.count - 1 && node.y == lines[0].count - 1 {
//        print("destination")
        print(node.value)
        break
    }

    for d in [-1, 1] {
        var cost = node.value

        for i in 1...3 {
            let x = node.direction == 1 ? node.x + i * d : node.x
            let y = node.direction == 1 ? node.y : node.y + i * d
            guard (0..<lines.count).contains(x) && (0..<lines[0].count).contains(y) else { continue }
            cost += lines[x][y]
        }
//        print("cost", cost, d)
        for i in 4...10 {
            let x = node.direction == 1 ? node.x + i * d : node.x
            let y = node.direction == 1 ? node.y : node.y + i * d
//            print("neighbor", x, y)
            guard (0..<lines.count).contains(x) && (0..<lines[0].count).contains(y) else { continue }
            cost += lines[x][y]
//            print("neighbor cost", cost)
            let newNode = Node(value: cost, x: x, y: y, direction: 1 - node.direction)
            guard !visited.contains(newNode) else { continue }
            queue.push(newNode)
        }
    }

    visited.insert(node)
}
