import Foundation
import Core
import Collections

let input = """
029A
980A
179A
456A
379A
"""

func findPathsOnGrid(_ grid: Grid<String>, start: Point, end: Point) -> [String] {
    var heap: Heap<Node> = [Node(point: start, orientation: .start)]
    var endNodes: [Node] = []

    while let node = heap.popMin() {
        if node.point == end {
            let endNodeValue = endNodes.first?.value ?? .max
            if node.value < endNodeValue {
                endNodes = [node]
            } else if node.value == endNodeValue {
                endNodes.append(node)
            }

            continue
        }

        if
            let endNode = endNodes.first,
            node.value > endNode.value
        {
            continue
        }

        var predecessors: Set<Point> = []
        iteratePredecessorsOf(node) {
            predecessors.insert($0.point)
        }

        let next = [
            node.up(),
            node.down(),
            node.left(),
            node.right(),
        ]
            .filter { grid.contains($0.point) }
            .filter { grid[$0.point] != "#" }
            .filter { !predecessors.contains($0.point) }

        next.forEach { nextNode in
            var value: Int {
                if node.orientation == .start { return 1 }
                else if node.orientation == nextNode.orientation { return node.value + 1 }
                else { return node.value + 1001 }
            }
            nextNode.value = value
            nextNode.predecessor = node
            heap.insert(nextNode)
        }
    }

    return endNodes.map { endNode in
        var path: [Orientation] = []
        iteratePredecessorsOf(endNode) {
            path.append($0.orientation)
        }
        return path.reversed().filter { $0 != .start }.map(\.rawValue).joined()
    }
}

actor Storage {
    private var storage: [[String: Int]]

    init(depth: Int) {
        storage = Array(repeating: [:], count: depth + 1)
    }

    func valueForCode(_ code: String, inDepth depth: Int) -> Int? {
        storage[depth][code]
    }

    func setValue(_ value: Int, forCode code: String, inDepth depth: Int) {
        storage[depth][code] = value
    }
}

let storage = Storage(depth: 26)

let numberKeypadString = """
789
456
123
#0A
"""
var numberKeypad = Grid<String>(numberKeypadString)

let directionalKeypadString = """
#^A
<v>
"""
var directionalKeypad = Grid<String>(directionalKeypadString)

@MainActor
func computeLengthOfCode(_ codeInput: String, depth: Int) async -> Int {
    print("CLOF", codeInput, depth)
    if depth == 0 {
        if codeInput.hasPrefix("A") {
            return codeInput.count - 1
        } else {
            return codeInput.count
        }
    }

    if let length = await storage.valueForCode(codeInput, inDepth: depth) {
        return length
    }

    let code = Array(codeInput).map(String.init)
    let subcodes = (1..<code.count).map { code[$0 - 1] + code[$0] }
    var sublengths: [Int] = []
    for subcode in subcodes {
        if let sublength = await storage.valueForCode(subcode, inDepth: depth) {
            sublengths.append(sublength)
        } else {
            break
        }
    }

    if subcodes.count == sublengths.count {
        let length = sublengths.reduce(0, +)
        await storage.setValue(length, forCode: codeInput, inDepth: depth)
        return length
    }

//    let path = (1..<code.count).map { i in
//        let key = code[i - 1] + code[i]
//        return translations[key]!
//    }
//    .joined()
    let path = "TODO"

    let pathLength = await computeLengthOfCode(path, depth: depth - 1)

    await storage.setValue(pathLength, forCode: codeInput, inDepth: depth)

    return pathLength
}

func findCodePaths(_ code: String, onGrid grid: Grid<String>) -> [String] {
    let code = Array(code).map(String.init)
    var paths: [String] = [""]

    (1..<code.count).forEach { i in
        let start = grid.find(code[i - 1])!
        let end = grid.find(code[i])!
        let childPaths = findPathsOnGrid(grid, start: start, end: end).map { $0 + "A" }
        paths = paths.flatMap { path in
            childPaths.map { path + $0 }
        }
    }

    return paths
}

let codes = input.components(separatedBy: "\n")
//var result = Array(repeating: 0, count: codes.count)
var result = 0

await measureTime {
//    DispatchQueue.concurrentPerform(iterations: codes.count) { i in
//    for i in 0..<codes.count {
    let i = 0
        let code = codes[i]
        let paths = findCodePaths("A" + code, onGrid: numberKeypad)
        var pathLengths: [Int] = []
        for path in paths {
            let pathLength = await computeLengthOfCode("A" + path, depth: 2)
            print("PTLN", path, pathLength)
            pathLengths.append(pathLength)
        }
        let pathLength = pathLengths.min()!

        let numericCode = Int(code.dropLast())!

        print(code, pathLength)

        result += pathLength * numericCode
//    }
    print(result)
}
