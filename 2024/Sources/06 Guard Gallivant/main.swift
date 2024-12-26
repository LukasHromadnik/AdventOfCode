import Foundation

struct Position: Hashable {
    let x: Int
    let y: Int
}

func + (lhs: Position, rhs: (Int, Int)) -> Position {
    Position(x: lhs.x + rhs.0, y: lhs.y + rhs.1)
}

enum Orientation: Hashable {
    case up(Position), down(Position), left(Position), right(Position)

    var position: Position {
        switch self {
        case let .up(position): position
        case let .down(position): position
        case let .left(position): position
        case let .right(position): position
        }
    }

    func rotate() -> Orientation {
        switch self {
        case let .up(position): .right(position)
        case let .right(position): .down(position)
        case let .down(position): .left(position)
        case let .left(position): .up(position)
        }
    }

    func setPosition(_ position: Position) -> Orientation {
        switch self {
        case .up: .up(position)
        case .left: .left(position)
        case .right: .right(position)
        case .down: .down(position)
        }
    }

    var offset: (Int, Int) {
        switch self {
        case .up:    (-1,  0)
        case .right: ( 0,  1)
        case .down:  ( 1,  0)
        case .left:  ( 0, -1)
        }
    }

    var nextPosition: Position {
        position + offset
    }
}

let maze = mainInput.components(separatedBy: "\n").map { Array($0).map(String.init) }

// Detect start position
var startPosition = (-1, -1)
outerLoop: for i in 0..<maze.count {
    for j in 0..<maze[i].count {
        if maze[i][j] == "^" {
            startPosition = (i, j)
            break outerLoop
        }
    }
}
var start = Orientation.up(Position(x: startPosition.0, y: startPosition.1))

class CycleError: Error { }

func solve(
    blocked: Position = Position(x: -1, y: -1)
) throws -> [Position] {
    var path = Set<Orientation>([start])
    var orientation = start

    while true {
        if let nextOrientation = move(
            currentOrientation: orientation,
            blocked: blocked
        ) {
            if path.contains(nextOrientation) {
                throw CycleError()
            } else {
                path.insert(nextOrientation)
            }

            orientation = nextOrientation
        } else {
            break
        }
    }

    return Array(Set(path.map(\.position)))
}

func move(
    currentOrientation: Orientation,
    blocked: Position
) -> Orientation? {
    let to = currentOrientation.nextPosition

    if to.x < 0 || to.x >= maze.count || to.y < 0 || to.y >= maze[0].count {
        return nil
    } else {
        let nextSymbol = maze[to.x][to.y]
        if nextSymbol == "#" || to == blocked {
            return currentOrientation.rotate()
        } else {
            return currentOrientation.setPosition(to)
        }
    }
}

print(Date())

var blockers = try! solve()
blockers.removeAll { $0 == start.position }

var sum = 0
//DispatchQueue.concurrentPerform(iterations: blockers.count) { i in
for i in 0..<blockers.count {
    let blocker = blockers[i]
    do {
        let path = try solve(blocked: blocker)
//        print(result)
    } catch {
        sum += 1
    }
}

print(sum)
print(Date())
