import Foundation
import Algorithms

typealias Grid = [[String]]
func loadGrid(_ input: String) -> Grid {
    input.components(separatedBy: "\n").map { Array($0).map(String.init) }
}

func printGrid(_ grid: Grid) {
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            print(grid[i][j], terminator: "")
        }
        print()
    }
}

let input = """
............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............
"""

let input2 = """
T.........
...T......
.T........
..........
..........
..........
..........
..........
..........
..........
"""

var grid = loadGrid(input)

// Group antennas by frequency
var groupedAntennas: [String: [(Int, Int)]] = [:]
for i in 0..<grid.count {
    for j in 0..<grid[i].count {
        guard grid[i][j] != "." else { continue }
        let antenna = grid[i][j]
        if let positions = groupedAntennas[antenna] {
            groupedAntennas[antenna] = positions + [(i, j)]
        } else {
            groupedAntennas[antenna] = [(i, j)]
        }
    }
}

let newPositions = groupedAntennas.flatMap { _, positions in
    positions.combinations(ofCount: 2).flatMap { combination in
        let lhs = combination[0]
        let rhs = combination[1]

        let distanceX = lhs.0 - rhs.0
        let distanceY = lhs.1 - rhs.1

        var positions: [(Int, Int)] = []

        var i = 1
//        while i == 1 {
        while true {
            let newPositions = [
                (lhs.0 + distanceX * i, lhs.1 + distanceY * i),
                (lhs.0 - distanceX * i, lhs.1 - distanceY * i),
                (rhs.0 + distanceX * i, rhs.1 + distanceY * i),
                (rhs.0 - distanceX * i, rhs.1 - distanceY * i)
            ].filter { position in
                position.0 >= 0 && position.0 < grid.count && position.1 >= 0 && position.1 < grid[0].count
            }

            if newPositions.isEmpty {
                break
            }

            positions.append(contentsOf: newPositions)
            i += 1
        }

//        return positions.filter { $0 != lhs && $0 != rhs }
        return positions
    }
}

newPositions.forEach {
    grid[$0.0][$0.1] = "#"
}
printGrid(grid)

let antennasPositions = groupedAntennas.flatMap(\.value)
let validPositions = newPositions
//    .filter { position in
//        position.0 >= 0 && position.0 < grid.count && position.1 >= 0 && position.1 < grid[0].count
//    }

struct Position: Hashable {
    let x: Int
    let y: Int
}
print(Set(validPositions.map { Position(x: $0.0, y: $0.1) }).count)
//print(validPositions.count)
