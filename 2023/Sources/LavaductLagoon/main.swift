import Foundation

enum Direction: CustomStringConvertible {
    case up(Int)
    case left(Int)
    case down(Int)
    case right(Int)

    var letter: String {
        switch self {
        case .up: "U"
        case .left: "L"
        case .down: "D"
        case .right: "R"
        }
    }

    var value: Int {
        switch self {
        case .up(let int): int
        case .left(let int): int
        case .down(let int): int
        case .right(let int): int
        }
    }

    init?(letter: String, value: Int) {
        switch letter {
        case "U": self = .up(value)
        case "L": self = .left(value)
        case "D": self = .down(value)
        case "R": self = .right(value)
        default: return nil
        }
    }

    var description: String {
        letter + " " + String(value)
    }
}

let input = """
R 6 (#70c710)
D 5 (#0dc571)
L 2 (#5713f0)
D 2 (#d2c081)
R 2 (#59c680)
D 2 (#411b91)
L 5 (#8ceee2)
U 2 (#caa173)
L 1 (#1b58a2)
U 2 (#caa171)
R 2 (#7807d2)
U 3 (#a77fa3)
L 2 (#015232)
U 2 (#7a21e3)
"""

//let lines = mainInput.components(separatedBy: "\n")
//    .compactMap {
//        let parts = $0.components(separatedBy: " ")
//        return Direction(letter: parts[0], value: Int(parts[1])!)
//    }
let lines = mainInput.components(separatedBy: "\n")
    .compactMap {
        let hexString = Array($0.components(separatedBy: " ").last!)
        let hex = String(hexString[2...6])
        let hexValue = Int(hex, radix: 16)!
        let letter = switch hexString[7] {
        case "0": "R"
        case "1": "D"
        case "2": "L"
        case "3": "U"
        default: ""
        }
        return Direction(letter: letter, value: hexValue)
    }

var indexes: [(Int, Int)] = [(0, 0)]
var count = 0
for i in 0..<lines.count {
    let point = indexes.last!
    switch lines[i] {
    case let .up(value):
        indexes.append((point.0 - value, point.1))
        count += value

    case let .left(value):
        indexes.append((point.0, point.1 - value))
        count += value

    case let .down(value):
        indexes.append((point.0 + value, point.1))
        count += value

    case let .right(value):
        indexes.append((point.0, point.1 + value))
        count += value
    }
}

indexes.reverse()
var sum = 0
for i in 0..<indexes.count - 1 {
    let (x1, y1) = indexes[i]
    let (x2, y2) = indexes[i + 1]
    sum += (x1 * y2) - (x2 * y1)
}

let a = Int(Double(sum / 2))
let b = count
let i = a - (b / 2) + 1

print(b + i)
