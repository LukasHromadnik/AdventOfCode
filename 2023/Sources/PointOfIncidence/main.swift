import Foundation

let input = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
"""

let input2 = """
##.#...#..#
##.#...#..#
###....#..#
####.####.#
.###..#.##.
###...##.##
#...###.#..
#...###.#..
###...##.##
.###..#.##.
####.####.#
###....#..#
##.##..#..#
"""

func lineDistance(_ first: String, _ second: String) -> Int {
    zip(Array(first), Array(second))
        .map { $0 != $1 ? 1 : 0 }
        .reduce(0, +)
}

func testMirror(index: Int, lines: [String]) -> Bool {
    var i = 0
    var distances = 0
    repeat {
        distances += lineDistance(lines[index - i], lines[index + 1 + i])
        i += 1
    } while index - i >= 0 && index + 1 + i < lines.count

    return distances == 1
}

func transpose(_ lines: [String]) -> [String] {
    var newLines: [String] = []
    for j in 0..<lines[0].count {
        var row: [String.Element] = []
        for i in 0..<lines.count {
            let index = lines[i].index(lines[i].startIndex, offsetBy: j)
            row.append(lines[i][index])
        }
        newLines.append(String(row))
    }
    return newLines
}

let result = mainInput.components(separatedBy: "\n\n").map { $0.components(separatedBy: "\n") }
    .map {
        for i in 0..<$0.count - 1 {
            if testMirror(index: i, lines: $0) {
                return (0, i + 1)
            }
        }
        let transposed = transpose($0)
        for i in 0..<transposed.count - 1 {
            if testMirror(index: i, lines: transposed) {
                return (i + 1, 0)
            }
        }
        assertionFailure()
        return (0, 0)
    }
    .reduce((0, 0)) { acc, next in
        (acc.0 + next.0, acc.1 + next.1)
    }
print(result.0 + 100 * result.1)
