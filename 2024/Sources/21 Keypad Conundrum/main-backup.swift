//import Foundation
//import Collections
//
//let input = """
//029A
//980A
//179A
//456A
//379A
//"""
//
//func iteratePredecessors(_ node: Node, closure: (Node) -> Void) {
//    var predecessor: Node! = node
//    while predecessor != nil {
//        closure(predecessor)
//        predecessor = predecessor.predecessor
//    }
//}
//
//func findPathsOnGrid(_ grid: Grid<String>, start: Point, end: Point) -> [String] {
//    var heap: Heap<Node> = [Node(point: start, orientation: .start)]
//    var endNodes: [Node] = []
//
//    while let node = heap.popMin() {
//        if node.point == end {
//            let endNodeValue = endNodes.first?.value ?? .max
//            if node.value < endNodeValue {
//                endNodes = [node]
//            } else if node.value == endNodeValue {
//                endNodes.append(node)
//            }
//
//            continue
//        }
//
//        if
//            let endNode = endNodes.first,
//            node.value > endNode.value
//        {
//            continue
//        }
//
//        var predecessors: Set<Point> = []
//        iteratePredecessors(node) {
//            predecessors.insert($0.point)
//        }
//
//        let next = [
//            node.up(),
//            node.down(),
//            node.left(),
//            node.right(),
//        ]
//            .filter { grid.contains($0.point) }
//            .filter { grid[$0.point] != "#" }
//            .filter { !predecessors.contains($0.point) }
//
//        next.forEach { nextNode in
//            var value: Int {
//                if node.orientation == .start { return 1 }
//                else if node.orientation == nextNode.orientation { return node.value + 1 }
//                else { return node.value + 1001 }
//            }
//            nextNode.value = value
//            nextNode.predecessor = node
//            heap.insert(nextNode)
//        }
//    }
//
//    return endNodes.map { endNode in
//        var path: [Orientation] = []
//        iteratePredecessors(endNode) {
//            path.append($0.orientation)
//        }
//        return path.reversed().filter { $0 != .start }.map(\.rawValue).joined()
//    }
//}
//
//struct StorageKey: Hashable {
//    let nodes: Set<String>
//    let depth: Int
//}
//
//let storage: [StorageKey: Int] = [:]
//
//let keypadString = """
//789
//456
//123
//#0A
//"""
//var keypad = Grid<String>(keypadString)
//
//let keypad2String = """
//#^A
//<v>
//"""
//var keypad2 = Grid<String>(keypad2String)
//
//func findCodePaths(_ code: String, onGrid grid: Grid<String>) -> [String] {
//    let code = Array("A" + code).map(String.init)
//    var paths: [String] = [""]
//
//    (1..<code.count).forEach { i in
//        let start = grid.find(code[i - 1])!
//        let end = grid.find(code[i])!
//        let childPaths = findPathsOnGrid(grid, start: start, end: end).map { $0 + "A" }
//        paths = paths.flatMap { path in
//            childPaths.map { path + $0 }
//        }
//    }
//
//    return paths
//}
//
//let codes = mainInput.components(separatedBy: "\n")
//var result = Array(repeating: 0, count: codes.count)
//
//let startDate = Date()
//let code = codes[4]
//DispatchQueue.concurrentPerform(iterations: codes.count) {
//    let code = codes[$0]
//    let paths = findCodePaths(code, onGrid: keypad).flatMap { path in
//        findCodePaths(path, onGrid: keypad2).flatMap { path in
//            findCodePaths(path, onGrid: keypad2)
//        }
//    }
//
//    let pathLength = paths.map(\.count).min()!
//    let numericCode = Int(code.dropLast())!
//
//    print(code, pathLength)
//
//    result[$0] = pathLength * numericCode
//}
//print(result.reduce(0, +))
//
//let endDate = Date()
//print("Duration", endDate.timeIntervalSince(startDate))
