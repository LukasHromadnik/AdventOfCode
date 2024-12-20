import Foundation

let input1 = ">"
let input2 = "^>v<"
let input3 = "^v^v^v^v^v"
let input4 = "^v"

struct Point: Hashable {
    var i: Int
    var j: Int

    static let zero = Point(i: 0, j: 0)

    mutating func up() {
        i -= 1
    }

    mutating func down() {
        i += 1
    }

    mutating func left() {
        j -= 1
    }

    mutating func right() {
        j += 1
    }
}

var point: Point = .zero
var roboPoint: Point = .zero
var positions: Set<Point> = [point, roboPoint]

let loaded = Array(mainInput).map(String.init)
var i = true
loaded.forEach { move in
    switch move {
    case "^": i ? point.up() : roboPoint.up()
    case ">": i ? point.right() : roboPoint.right()
    case "v": i ? point.down() : roboPoint.down()
    case "<": i ? point.left() : roboPoint.left()
    default: assertionFailure()
    }
    positions.insert(point)
    positions.insert(roboPoint)
    i.toggle()
}
print(positions.count)
