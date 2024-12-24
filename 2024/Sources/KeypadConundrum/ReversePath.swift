import Foundation

func reversePath(_ path: String, onGrid grid: Grid<String>) -> String {
    var point = grid.find("A")!
    let steps = Array(path).map(String.init)
    var path: [String] = []
    for step in steps {
        switch step {
        case "^": point = point.up()
        case "v": point = point.down()
        case "<": point = point.left()
        case ">": point = point.right()
        case "A": path.append(grid[point])
        default: assertionFailure()
        }
    }

    return path.joined()
}

//let r1 = reversePath("<v<A>>^AvA^A<vA<AA>>^AAvA<^A>AAvA^A<vA>^AA<A>A<v<A>A>^AAAvA<^A>A", onGrid: keypad2)
//let r2 = reversePath(r1, onGrid: keypad2)
//let r3 = reversePath(r2, onGrid: keypad)
//print(r1)
//print(r2)
//print(r3)
