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

func findPathsOnGrid(
    _ grid: Grid<String>,
    start: Point,
    end: Point
) -> [String] {
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

func findCodePaths(
    _ code: String,
    onGrid grid: Grid<String>
) -> [String] {
    let code = Array(code).map(String.init)
    var paths = [""]

    for i in 1..<code.count {
        let start = code[i - 1]
        let end = code[i]
        let startPoint = grid.find(start)!
        let endPoint = grid.find(end)!
        let newPaths = findPathsOnGrid(grid, start: startPoint, end: endPoint).map { $0 + "A" }
        paths = paths.flatMap { old in
            newPaths.map { old + $0 }
        }
    }

    return paths
}

var storage: [[String: Int]] = Array(repeating: [:], count: 26)

let codes = mainInput.components(separatedBy: "\n")
let result = codes
    .map { code in
        let length = findCodePaths("A" + code, onGrid: numberKeypad)
            .map { codeLength($0, depth: 25) }
            .min()!
        let numericCode = Int(code.dropLast())!
        return length * numericCode
    }
    .reduce(0, +)
print(result)

func codeLength(_ code: String, depth: Int) -> Int {
    guard depth > 0 else { return code.count }

    let components = code.components(separatedBy: "A").dropLast().map { "A" + $0 + "A" }
    let lengths = components
        .map {
            if let length = storage[depth][$0] {
                return length
            } else {
                let length = findCodePaths($0, onGrid: directionalKeypad)
                    .map { codeLength($0, depth: depth - 1) }
                    .min()!
                storage[depth][$0] = length
                return length
            }
        }
        .reduce(0, +)

    return lengths
}

func testCodeLength() {
    let code = "<A^A^^>AvvvA"
    let code1 = "v<<A>>^A<A>A<AAv>A^Av<AAA>^A"
    let code2 = "<vA<AA>>^AvAA<^A>Av<<A>>^AvA^Av<<A>>^AA<vA>A^A<A>A<vA<A>>^AAAvA^<A>A"

    assert(codeLength(code, depth: 0) == code.count)
    assert(codeLength(code, depth: 1) == code1.count)
    assert(codeLength(code, depth: 2) == code2.count)
}

func testPart1() {
    assert(solveInput(input) == 126384)
    assert(solveInput(mainInput) == 246990)
}

func solveInput(_ input: String) -> Int {
    input.components(separatedBy: "\n")
        .map { code in
            let length = findCodePaths("A" + code, onGrid: numberKeypad)
                .map { codeLength($0, depth: 2) }
                .min()!
            let numericCode = Int(code.dropLast())!
            return length * numericCode
        }
        .reduce(0, +)
}

func test() {
    testCodeLength()
    testPart1()
}

//test()
