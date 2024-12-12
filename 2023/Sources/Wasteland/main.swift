import Foundation

let input = """
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
"""

let parts = mainInput.components(separatedBy: "\n\n")
let instructions = Array(parts[0])
let nodes = parts[1].components(separatedBy: "\n")
    .map { line in line.ranges(of: /[A-Z0-9]{3}/).map { String(line[$0]) } }
    .reduce(into: [String: (String, String)]()) { acc, next in
        acc[next[0]] = (next[1], next[2])
    }

var currentNodes = Array(nodes.keys.filter { $0.hasSuffix("A") })
let steps = currentNodes.map { node in
    var node = node
    var steps = 0
    var instructionIndex = 0
    while true {
        guard let list = nodes[node] else { break }
        let i = instructions[instructionIndex]
        node = i == "L" ? list.0 : list.1
        steps += 1
        instructionIndex = (instructionIndex + 1) % instructions.count

        if node.hasSuffix("Z") {
            break
        }
    }

    return steps
}

print(steps)

let result = steps.reduce(into: steps[0]) { acc, next in
    acc = lcm(acc, next)
}

print(result)

func gcd(_ x: Int, _ y: Int) -> Int {
    var a = 0
    var b = max(x, y)
    var r = min(x, y)

    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}

func lcm(_ x: Int, _ y: Int) -> Int {
    x / gcd(x, y) * y
}


/*
var steps = 0
var instructionIndex = 0
while true {
    let i = instructions[instructionIndex]

    let nextNodes = currentNodes
        .compactMap { nodes[$0] }
        .map { i == "L" ? $0.0 :  $0.1 }
    currentNodes = nextNodes

    steps += 1
    instructionIndex = (instructionIndex + 1) % instructions.count

    if currentNodes.allSatisfy({ $0.hasSuffix("Z") }) {
        break
    }
}

print(steps)
*/
