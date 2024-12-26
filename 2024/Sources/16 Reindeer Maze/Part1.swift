import Collections

//func part1() -> Int {
//    var heap = Heap<Node>([Node(point: startPoint, orientation: .right, value: 0)])
//    var minValue = Int.max
//    var visited = Set<Node>()
//
//    while let minNode = heap.popMin() {
//        if grid[minNode.point.i][minNode.point.j] == "E" {
//            minValue = min(minValue, minNode.value)
//            break
//        }
//
//        if minNode.value > minValue { continue }
//
//        if visited.contains(minNode) { continue }
//        visited.insert(minNode)
//
//        let nextNodes = [
//            minNode.up(),
//            minNode.left(),
//            minNode.down(),
//            minNode.right()
//        ]
//            .filter { $0.point.isInBounds(of: grid) }
//            .filter { grid[$0.point.i][$0.point.j] != "#" }
//            .filter { n in !heap.unordered.contains { $0.point == n.point && $0.orientation == n.orientation && $0.value <= n.value } }
//
//        nextNodes.forEach {
//            heap.insert($0)
//        }
//    }
//
//    return minValue
//}
