import Foundation
import Core

let input = """
..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.
"""

var result: [Point] = []
var didChange = true
enum E: String, GridElement {
    case empty = "."
    case roll = "@"
    case mark = "x"
}

var grid = Grid<E>(mainInput)
while didChange {
    didChange = false
    for point in grid.indexes {
        guard grid[point] == .roll else { continue }
        let neighbors: [E] = point.neighbors8().map { p in
            if p.i < 0 || p.i >= grid.numberOfRows || p.j < 0 || p.j >= grid.numberOfColumns {
                return .empty
            } else {
                return grid[p]
            }
        }
        let numberOfRolls = neighbors.count { $0 == .roll }
        if numberOfRolls < 4 {
            result.append(point)
            didChange = true
        }
    }

    for p in result {
        grid[p] = .empty
    }
}
//print(grid)
print(result.count)
assert(result.count == 9086)
