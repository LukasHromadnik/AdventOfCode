import Foundation

let input = """
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
"""

let expansion = 1_000_000
var lines = mainInput.components(separatedBy: "\n").map(Array.init)
lines.enumerated()
    .filter { !$0.element.contains { $0 == "#" } }
    .map(\.offset)
    .forEach { i in
        for j in 0..<lines[i].count {
            lines[i][j] = "-"
        }
    }
(0..<lines[0].count)
    .map { i in lines.map { Array($0)[i] } }
    .enumerated()
    .filter { !$0.element.contains { $0 == "#" } }
    .map(\.offset)
    .forEach { i in
        for j in 0..<lines.count {
            lines[j][i] = "*"
        }
    }

var indexes: [(Int, Int)] = []
var rowCount = 0
for i in 0..<lines.count {
    rowCount += lines[i][0] == "-" ? expansion : 1
    var numberOfExpansions = 0
    for j in 0..<lines[i].count {
        if lines[i][j] == "*" {
            numberOfExpansions += 1
        }
        if lines[i][j] == "#" {
            indexes.append((rowCount, numberOfExpansions * expansion - numberOfExpansions + j))
        }
    }
}

var result = 0
for i in 0..<indexes.count - 1 {
    for j in i + 1..<indexes.count {
        let i1 = indexes[i]
        let i2 = indexes[j]
        result += abs(i2.1 - i1.1) + abs(i2.0 - i1.0)
    }
}
print(result)
