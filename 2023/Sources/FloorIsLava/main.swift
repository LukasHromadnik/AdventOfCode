import Foundation

let input = #"""
.|...\....
|.-.\.....
.....|-...
........|.
..........
.........\
..../.\\..
.-.-/..|..
.|....-|.\
..//.|....
"""#

let input2 = #"""
.\..
.-|.
.|-.
....
"""#

let lines = mainInput.components(separatedBy: "\n").map(Array.init)
enum Direction {
    case right((Int, Int)), left((Int, Int)), up((Int, Int)), down((Int, Int))
    var coord: (Int, Int) {
        switch self {
        case let .right(coord), let .left(coord), let .up(coord), let .down(coord): coord
        }
    }

    var up: Direction {
        .up((coord.0 - 1, coord.1))
    }

    var down: Direction {
        .down((coord.0 + 1, coord.1))
    }

    var left: Direction {
        .left((coord.0, coord.1 - 1))
    }

    var right: Direction {
        .right((coord.0, coord.1 + 1))
    }
}

extension Direction: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .right: hasher.combine("right")
        case .left: hasher.combine("left")
        case .up: hasher.combine("up")
        case .down: hasher.combine("down")
        }
        hasher.combine(coord.0 * 1000 + coord.1)
    }
}

extension Direction: Equatable {
    static func == (lhs: Direction, rhs: Direction) -> Bool {
        switch (lhs, rhs) {
        case let (.left(coord1), .left(coord2)): coord1 == coord2
        case let (.right(coord1), .right(coord2)): coord1 == coord2
        case let (.up(coord1), .up(coord2)): coord1 == coord2
        case let (.down(coord1), .down(coord2)): coord1 == coord2
        default: false
        }
    }
}

func isValid(_ direction: Direction) -> Bool {
    (0..<lines.count).contains(direction.coord.0) && (0..<lines[0].count).contains(direction.coord.1)
}

let leftEdge = (0..<lines.count).map { Direction.right(($0, 0)) }
let rightEdge = (0..<lines.count).map { Direction.left(($0, lines[0].count - 1)) }
let topEdge = (0..<lines[0].count).map { Direction.down((0, $0)) }
let bottomEdge = (0..<lines[0].count).map { Direction.up((lines.count - 1, $0)) }
//let initial = leftEdge + rightEdge + topEdge + bottomEdge
let initial: [Direction] = [.right((0, 0))]

var maxValues: [Int] = Array(repeating: 0, count: initial.count)

DispatchQueue.concurrentPerform(iterations: initial.count) { index in
    var explore: Set<Direction> = .init([initial[index]])
    var grid = Array<[Bool]>(
        repeating: Array<Bool>(repeating: false, count: lines[0].count),
        count: lines.count
    )
    var visited = Array<Array<Set<Direction>>>(
        repeating: Array<Set<Direction>>(repeating: .init(), count: lines[0].count),
        count: lines.count
    )

    while !explore.isEmpty {
        let item = explore.popFirst()!
        let coord = item.coord

        guard isValid(item) else { continue }
        if explore.contains(where: { $0 == item }) {
            continue
        }
        if visited[coord.0][coord.1].contains(item) {
            continue
        }

        grid[coord.0][coord.1] = true

        switch lines[coord.0][coord.1] {
        case ".":
            switch item {
            case .down: explore.insert(item.down)
            case .up: explore.insert(item.up)
            case .left: explore.insert(item.left)
            case .right: explore.insert(item.right)
            }

        case "|":
            switch item {
            case .down: explore.insert(item.down)
            case .up: explore.insert(item.up)
            case .left, .right:
                explore.insert(item.up)
                explore.insert(item.down)
            }

        case "-":
            switch item {
            case .down, .up:
                explore.insert(item.left)
                explore.insert(item.right)
            case .left: explore.insert(item.left)
            case .right: explore.insert(item.right)
            }

        case "/":
            switch item {
            case .down: explore.insert(item.left)
            case .up: explore.insert(item.right)
            case .left: explore.insert(item.down)
            case .right: explore.insert(item.up)
            }

        case "\\":
            switch item {
            case .down: explore.insert(item.right)
            case .up: explore.insert(item.left)
            case .left: explore.insert(item.up)
            case .right: explore.insert(item.down)
            }

        default:
            assertionFailure()
        }

        visited[coord.0][coord.1].insert(item)
    }
    let value = grid.map { $0.reduce(0) { $0 + ($1 ? 1 : 0) } }.reduce(0, +)
    maxValues[index] = value
}

print(maxValues.max()!)
