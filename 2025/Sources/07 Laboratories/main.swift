import Foundation
import Core

let input = """
.......S.......
...............
.......^.......
...............
......^.^......
...............
.....^.^.^.....
...............
....^.^...^....
...............
...^.^...^.^...
...............
..^...^.....^..
...............
.^.^.^.^.^...^.
...............
"""

enum Item: String, GridElement {
    case start = "S"
    case empty = "."
    case splitter = "^"
}

let grid = Grid<Item>(mainInput)
var values: [[Int]] = (0..<grid.numberOfRows).map { _ in Array(repeating: 0, count: grid.numberOfColumns) }

for i in 1..<grid.numberOfRows {
    for j in 0..<grid.numberOfColumns {
        if grid[i - 1][j] == .start {
            values[i][j] = 1
        } else if grid[i][j] == .splitter && values[i - 1][j] > 0 {
            values[i][j - 1] += values[i - 1][j]
            values[i][j + 1] += values[i - 1][j]
        } else if values[i - 1][j] > 0 {
            values[i][j] += values[i - 1][j]
        }
    }
}

var result = 0
for i in 0..<grid.numberOfRows {
    for j in 0..<grid.numberOfColumns {
        if grid[Point(i, j)] == .splitter && values[i - 1][j] > 0 {
            result += 1
        }
    }
}
assert(result == 1562)

let result2 = values.last!.reduce(0, +)
assert(result2 == 24292631346665)
