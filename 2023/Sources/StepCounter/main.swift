import Foundation

let input = """
...........
.....###.#.
.###.##..#.
..#.#...#..
....#.#....
.##..S####.
.##..#...#.
.......##..
.##.#.####.
.##..##.##.
...........
"""

let input2 = """
.................................
.....###.#......###.#......###.#.
.###.##..#..###.##..#..###.##..#.
..#.#...#....#.#...#....#.#...#..
....#.#........#.#........#.#....
.##...####..##..S####..##...####.
.##..#...#..##..#...#..##..#...#.
.......##.........##.........##..
.##.#.####..##.#.####..##.#.####.
.##..##.##..##..##.##..##..##.##.
.................................
"""

let selectedInput = input2
class Grid {
    var lines: [[String]]

    init(input: String) {
        lines = input.components(separatedBy: "\n").map(Array.init).map { $0.map(String.init) }
    }

    subscript(_ x: Int) -> [String] {
        lines[x]
    }

    subscript(_ x: Int, _ y: Int) -> String {
        get { lines[x][y] }
        set { lines[x][y] = newValue }
    }

    func enumerated() -> EnumeratedSequence<[[String]]> {
        lines.enumerated()
    }

    var count: Int { lines.count }

    func setMark(_ mark: String, forX x: Int, y: Int) {
        lines[x][y] = mark
    }
}

var grid = Array<[Grid?]>(
    repeating: Array(repeating: nil, count: 202300),
    count: 202300
)

let centerGridX = 202300 / 2
let centerGridY = 202300 / 2
grid[centerGridX][centerGridY] = .init(input: selectedInput)

let lines = grid[centerGridX][centerGridY]!
let startX = lines.enumerated().filter { $0.element.contains("S") }.first!.offset
let startY: Int = lines[startX].firstIndex(of: "S")!

let steps = 64 /*26501365*/
var step = 0
var places = [(startX, startY, centerGridX, centerGridY)]
let maxLinesX = lines.count
let maxLinesY = lines[0].count
var results: [Int] = Array(repeating: 0, count: steps)
while step < steps {
    var newPlaces: [(Int, Int, Int, Int)] = []
    var result = 0
    for place in places {
        let neighbors = [(place.0 + 1, place.1), (place.0 - 1, place.1), (place.0, place.1 + 1), (place.0, place.1 - 1)]
            .map {
                let x = (0..<maxLinesX).contains($0.0) ? $0.0 : ($0.0 + maxLinesX) % maxLinesX
                let y = (0..<maxLinesY).contains($0.1) ? $0.1 : ($0.1 + maxLinesY) % maxLinesY
                let gridX = if $0.0 < 0 { place.2 - 1 } else if $0.0 >= maxLinesX { place.2 + 1 } else { place.2 }
                let gridY = if $0.1 < 0 { place.3 - 1 } else if $0.1 >= maxLinesY { place.3 + 1 } else { place.3 }
                
                if grid[gridX][gridY] == nil {
                    grid[gridX][gridY] = .init(input: selectedInput)
                }

                return (x, y, gridX, gridY)
            }
            .filter {
                let symbol = grid[$0.2][$0.3]![$0.0][$0.1]
                return symbol == "." || symbol == "S"
            }
        neighbors.forEach {
            let mark = step % 2 == 0 ? "0" : "-"
            if mark == "0" { result += 1 }
            grid[$0.2][$0.3]!.setMark(mark, forX: $0.0, y: $0.1)
        }
        
        newPlaces.append(contentsOf: neighbors)
    }
    results[step] = result
    places = newPlaces
    step += 1
    if step % 100_000 == 0 {
        print(result)
    }
}

print(results)

