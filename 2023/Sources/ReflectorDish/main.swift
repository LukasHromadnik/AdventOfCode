import Foundation

let input = """
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....
"""

func transpose(_ lines: [[String.Element]]) -> [[String.Element]] {
    var newLines: [[String.Element]] = []
    for j in 0..<lines[0].count {
        var row: [String.Element] = []
        for i in 0..<lines.count {
            let index = lines[i].index(lines[i].startIndex, offsetBy: j)
            row.append(lines[i][index])
        }
        newLines.append(row.reversed())
    }
    return newLines
}

// 109939
// 136

let _lines = mainInput.components(separatedBy: "\n").map { "#" + $0 + "#" }
let hashEdge = String(Array<String.Element>(repeating: "#", count: _lines[0].count))
var lines = ([hashEdge] + _lines + [hashEdge]).map(Array.init)

func tiltLines(_ lines: inout [[String.Element]]) {
    for x in 0..<lines.count {
        var numberOfRocks = 0
        for i in 0..<lines[x].count {
            switch lines[x][i] {
            case "O":
                numberOfRocks += 1
                lines[x][i] = "."

            case "#":
                if numberOfRocks == 0 { continue }
                (i - numberOfRocks..<i).forEach { lines[x][$0] = "O" }
                numberOfRocks = 0

            default:
                break
            }
        }
    }
}

func computeWeight(_ lines: [[String.Element]]) -> Int {
    lines
        .map { $0.enumerated().filter { $0.element == "O" }.map(\.offset).reduce(0, +) }
        .reduce(0, +)
}

//let cycles = 1_000_000_000
let cycles = 200
var weights = Array(repeating: 0, count: cycles + 1)
for i in 0..<cycles {
    // north
    lines = transpose(lines)

    weights[i] = computeWeight(lines)

    tiltLines(&lines)

    // west
    lines = transpose(lines)
    tiltLines(&lines)

    // south
    lines = transpose(lines)
    tiltLines(&lines)

    // east
    lines = transpose(lines)
    tiltLines(&lines)
}

lines = transpose(lines)
weights[cycles] = computeWeight(lines)

var maxIndex = 0
for i in 0..<Int(weights.count / 2) {
    let index = weights.count - 1 - i
    let suffix = weights[index..<weights.count]
    let prefix = weights[0..<index]
    if prefix[prefix.count - 1 - i..<prefix.count] == suffix {
        maxIndex = i
    }
}
let startIndex = weights.count - maxIndex - 1
let repeating = Array(weights[startIndex...])
let index = (1_000_000_000 - startIndex) % repeating.count
print(repeating[index])
